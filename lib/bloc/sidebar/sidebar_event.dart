class SidebarEvent {
  SidebarEvent();
}

class OnTapSidebar extends SidebarEvent {
  int? indexSidebar;

  OnTapSidebar({
    this.indexSidebar,
  });
}
