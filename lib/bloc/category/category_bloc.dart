import 'dart:developer';
import 'package:app_ecommerce_admin/app_ecommerce_admin.dart';
import 'package:app_ecommerce_admin/bloc/category/category_event.dart';
import 'package:app_ecommerce_admin/bloc/category/category_state.dart';
import 'package:app_ecommerce_admin/services/category_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitialState()) {
    on<GetAllCategory>(_getAllCategory);
  }
  final _categoryRepository = CategoryRepository();

  void _getAllCategory(event, emit) async {
    emit(CategoryLoadingState());
    try {
      final response = await _categoryRepository.getAllCategory();
      if (response.error.isEmpty) {
        emit(CategoryLoadedState(response));
      } else {
        emit(CategoryErrorState(response.error));
      }
    } catch (e) {
      log("ERROR : CATEGORY BLOC GET ALL CATEGORY ==> ${e.toString()}");
      Fluttertoast.showToast(msg: "ERROR : ${e.toString()}");
      emit(CategoryErrorState(e.toString()));
    }
  }
}
