import 'package:app_ecommerce_admin/src/domain/entities/category_entity.dart';

abstract class CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final CategoryEntity category;

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

class CategoryChangePageState extends CategoryState {}

class CategoryPageState extends CategoryState {
  int page;

  CategoryPageState({
    this.page = 0,
  });
}
