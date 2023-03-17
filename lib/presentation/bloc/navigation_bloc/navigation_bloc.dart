import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, SwitchTab> {
  NavigationBloc() : super(const SwitchTab(index: 0)) {
    on<NavigateToFeedView>((event, emit) {
      emit(SwitchTab(index: 0));
    });
    on<NavigateToConversationsView>((event, emit) {
      emit(SwitchTab(index: 1));
    });
    on<NavigateToSearchView>((event, emit) {
      emit(SwitchTab(index: 2));
    });
    on<NavigateToFriendRequestsView>((event, emit) {
      emit(SwitchTab(index: 3));
    });
    on<NavigateToProfileView>((event, emit) {
      emit(SwitchTab(index: 4));
    });
  }
}
