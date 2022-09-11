abstract class CategoryEvent {}

class GetAllCategory extends CategoryEvent {
  int page;

  GetAllCategory(this.page);
}

class OnChangedSortDate extends CategoryEvent {}

class OnSortByName extends CategoryEvent {
  bool isAscending;
  int index;
  String type;

  OnSortByName({
    this.isAscending = true,
    this.index = 0,
    this.type = '',
  });
}

class OnNextPrevPage extends CategoryEvent {
  bool isNext;

  OnNextPrevPage(this.isNext);
}

class OnChangePage extends CategoryEvent {
  int page;

  OnChangePage({this.page = 1});
}

class OnSearchByName extends CategoryEvent {
  String text;

  OnSearchByName(this.text);
}

class LastPage extends CategoryEvent {
  int page;

  LastPage({
    this.page = 1,
  });
}
