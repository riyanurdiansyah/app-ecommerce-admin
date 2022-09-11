abstract class CategoryEvent {}

class GetAllCategory extends CategoryEvent {
  int page;

  GetAllCategory(this.page);
}

class OnChangedSortDate extends CategoryEvent {}

class OnNextPrevPage extends CategoryEvent {
  bool isNext;

  OnNextPrevPage(this.isNext);
}

class OnChangePage extends CategoryEvent {
  int page;

  OnChangePage({this.page = 1});
}

class LastPage extends CategoryEvent {
  int page;

  LastPage({
    this.page = 1,
  });
}
