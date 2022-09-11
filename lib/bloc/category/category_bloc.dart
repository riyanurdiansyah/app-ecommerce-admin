import 'package:app_ecommerce_admin/admin_constanta.dart';
import 'package:app_ecommerce_admin/app_ecommerce_admin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  int _page = 0;
  int get page => _page;

  int _lastPage = 1;
  int get lastPage => _lastPage;

  String _sortNameText = '';
  String get sortNameText => _sortNameText;

  String _sortDateText = '';
  String get sortDateText => _sortDateText;

  CategoryBloc() : super(CategoryInitialState()) {
    on<GetAllCategory>(_getAllCategory);
    on<OnNextPrevPage>(_onNextPrev);
    on<OnSortByName>(_onSortByName);
  }
  final _categoryRepository = CategoryRepository();

  void _getAllCategory(event, emit) async {
    emit(CategoryLoadingState());
    try {
      final response = await _categoryRepository.getAllCategory(_page);
      if (response.error.isEmpty) {
        _lastPage = response.lastPage!;
        emit(CategoryLoadedState(response));
      } else {
        emit(CategoryErrorState(response.error));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "ERROR : ${e.toString()}");
      emit(CategoryErrorState(e.toString()));
    }
  }

  void _onNextPrev(event, emit) async {
    try {
      bool isNext = (event as OnNextPrevPage).isNext;
      if ((isNext && _page < _lastPage) || (isNext == false && _page > 1)) {
        emit(CategoryLoadingState());
        if (isNext) {
          if (_page < _lastPage) {
            _page++;
          }
        } else {
          if (_page > 1) {
            _page--;
          }
        }
        final response = await _categoryRepository.getAllCategory(_page);
        if (response.error.isEmpty) {
          emit(CategoryLoadedState(response));
        } else {
          emit(CategoryErrorState(response.error));
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "ERROR : ${e.toString()}");
      emit(CategoryErrorState(e.toString()));
    }
  }

  void _onSortByName(event, emit) {
    final listTemp = (state as CategoryLoadedState).category;
    final eventSort = (event as OnSortByName);
    bool isAscending = eventSort.isAscending;
    int indexSort = eventSort.index;
    String typeSort = eventSort.type;
    if (listTemp.data!.isNotEmpty && typeSort.isNotEmpty) {
      if (typeSort == 'name') {
        _sortNameText = listSortName[indexSort].title!;
        if (isAscending) {
          listTemp.data!.sort((a, b) => a.name!.compareTo(b.name!));
        } else {
          listTemp.data!.sort((a, b) => b.name!.compareTo(a.name!));
        }
      } else {
        _sortDateText = listSortDate[indexSort].title!;
        if (isAscending) {
          listTemp.data!.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        } else {
          listTemp.data!.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        }
      }
      emit(CategoryLoadedState(listTemp));
    }
  }
}
