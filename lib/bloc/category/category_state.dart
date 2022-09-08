import 'package:app_ecommerce_admin/models/category_m.dart';

abstract class CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final CategoryM category;

  CategoryLoadedState(
    this.category,
  );
}

class CategoryErrorState extends CategoryState {
  final String errorMessage;

  CategoryErrorState(
    this.errorMessage,
  );
}

class CategoryOnChangeSortDateState extends CategoryState {
  final String type;
  final String sortBy;

  CategoryOnChangeSortDateState(
    this.type,
    this.sortBy,
  );
}
