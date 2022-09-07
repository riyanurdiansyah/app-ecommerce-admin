import 'package:flutter_bloc/flutter_bloc.dart';

import 'sidebar_event.dart';
import 'sidebar_state.dart';

class SidebarBloc extends Bloc<SidebarEvent, SidebarState> {
  final int _indexSidebar = 0;
  int get indexSidebar => _indexSidebar;

  SidebarBloc() : super(InitialSidebarState()) {
    on<OnTapSidebar>(_onTapSidebar);
  }

  void _onTapSidebar(OnTapSidebar event, Emitter<SidebarState> emit) async {
    emit(state);
  }
}
