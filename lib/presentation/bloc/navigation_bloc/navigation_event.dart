part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToFeedView extends NavigationEvent {}

class NavigateToConversationsView extends NavigationEvent {}

class NavigateToSearchView extends NavigationEvent {}
class NavigateToFriendRequestsView extends NavigationEvent {}
class NavigateToProfileView extends NavigationEvent {}