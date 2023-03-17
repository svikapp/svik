import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik2/presentation/pages/conversations_view/conversations_view.dart';
import 'package:svik2/presentation/pages/feed_view/feed_view.dart';
import 'package:svik2/presentation/pages/friend_requests_view/friend_requests_view.dart';
import 'package:svik2/presentation/pages/profile_view/profile_view.dart';
import 'package:svik2/presentation/pages/search_view/search_view.dart';

import '../bloc/navigation_bloc/navigation_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, SwitchTab>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: state.index,
            children: [
              FeedView(),
              ConversationsView(),
              SearchView(),
              FriendRequestsView(),
              ProfileView()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            onTap: (index) {
              switch (index) {
                case 0:
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigateToFeedView());
                  break;
                case 1:
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigateToConversationsView());
                  break;
                case 2:
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigateToSearchView());
                  break;
                case 3:
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigateToFriendRequestsView());
                  break;
                case 4:
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigateToProfileView());
                  break;
                default:
              }
            },
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(EvaIcons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(EvaIcons.messageCircle),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(EvaIcons.search),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(EvaIcons.bell),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(EvaIcons.person),
                  label: ''),
            ],
          ),
        );
      },
    );
  }
}
