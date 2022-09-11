import 'package:app_ecommerce_admin/app_ecommerce_admin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  int _page = 1;
  int get page => _page;

  int _lastPage = 0;
  int get lastePage => _lastPage;

  CategoryBloc() : super(CategoryInitialState()) {
    on<GetAllCategory>(_getAllCategory);
    on<OnNextPrevPage>(_onChangePage);
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

  void _onChangePage(event, emit) async {
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
}
