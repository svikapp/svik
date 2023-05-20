import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../search_delegate.dart';
class SvikSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const SvikSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // elevation: 0,
      centerTitle: true,
      title: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            // Handle onTap event
            showSearch(context: context, delegate: MySearchDelegate());
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              children: [
                Icon(EvaIcons.search,size: 22,),
                SizedBox(width: 10.0),
                Text('Search in Svik',style: TextStyle(color: Colors.grey[700]),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
