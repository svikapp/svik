import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik2/presentation/cubit/bottomnav_cubit/bottomnav_cubit.dart';
import 'package:svik2/presentation/pages/conversations_view/conversations_view.dart';
import 'package:svik2/presentation/pages/feed_view/feed_view.dart';
import 'package:svik2/presentation/pages/friend_requests_view/friend_requests_view.dart';
import 'package:svik2/presentation/pages/profile_view/profile_view.dart';
import 'package:svik2/presentation/pages/search_view/search_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: currentIndex,
            children: const [
              FeedView(),
              ConversationsView(),
              SearchView(),
              FriendRequestsView(),
              ProfileView()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<BottomNavCubit>().updateBottomNav(index);
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
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(EvaIcons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(EvaIcons.bell),
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(EvaIcons.person),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
