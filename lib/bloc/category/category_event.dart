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

class LastPage extends CategoryEvent {
  int page;

  LastPage({
    this.page = 1,
  });
}
