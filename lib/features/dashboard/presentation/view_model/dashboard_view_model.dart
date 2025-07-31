import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veda_learn/features/dashboard/presentation/view_model/dashboard_event.dart';
import 'package:veda_learn/features/dashboard/presentation/view_model/dashboard_state.dart';

class DashboardViewModel extends Bloc<DashboardEvent, DashboardState> {
  DashboardViewModel() : super(const DashboardInitial()) {
    on<TabSelected>(_onTabSelected);
    on<LanguageSelected>(_onLanguageSelected);
  }

 void _onTabSelected(TabSelected event, Emitter<DashboardState> emit) {
  emit(DashboardInitial(
    selectedIndex: event.tabIndex,
    selectedCourse: state is DashboardInitial ? (state as DashboardInitial).selectedCourse : null,
  ));
}


  void _onLanguageSelected(LanguageSelected event, Emitter<DashboardState> emit) {
    emit(DashboardInitial(
      selectedIndex: state is DashboardInitial ? (state as DashboardInitial).selectedIndex : 0,
      selectedCourse: event.selectedCourse,
    ));
  }
}
