import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:svik2/presentation/pages/settings/widgets/settings_group.dart';

class SettingsList extends StatelessWidget {
  SettingsList({super.key});

  final List<List<Widget>> _settingsList = [
    [
      ListTile(
        leading: Icon(EvaIcons.personOutline),
        title: Text("Account"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(EvaIcons.heartOutline),
        title: Text("Donate"),
        onTap: () {},
      ),
    ],
    [
      ListTile(
        leading: Icon(EvaIcons.sunOutline),
        title: Text("Appearance"),
        // onTap: ()=>Navigator.pushNamed(, "/settings/theme"),
      ),
    ],
    [
      ListTile(
        leading: Icon(EvaIcons.questionMarkCircleOutline),
        title: Text("Help"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(EvaIcons.inboxOutline),
        title: Text("Invite Friends"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(EvaIcons.infoOutline),
        title: Text("About"),
        onTap: () {},
      ),
    ]
  ];
  Widget divider = const Divider(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   itemBuilder: (context, index) {
    //     return SettingsGroup(children: _settingsList[index]);
    //   },
    //   separatorBuilder: (context, index) {
    //     return const Divider(
    //       height: 10,
    //       // thickness: 2,
    //     );
    //   },
    //   itemCount: _settingsList.length,
    // );
    return ListView(
      children: [
        SettingsGroup(
          children: [
            ListTile(
              leading: Icon(EvaIcons.personOutline),
              title: Text("Account"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(EvaIcons.heartOutline),
              title: Text("Donate"),
              onTap: () {},
            ),
          ],
        ),
        divider,
        SettingsGroup(
          children: [
            ListTile(
              leading: Icon(EvaIcons.sunOutline),
              title: Text("Appearance"),
              onTap: () => Navigator.pushNamed(context, "/settings/theme"),
            ),
          ],
        ),
        divider,
        SettingsGroup(
          children: [
            ListTile(
              leading: Icon(EvaIcons.questionMarkCircleOutline),
              title: Text("Help"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(EvaIcons.inboxOutline),
              title: Text("Invite Friends"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(EvaIcons.infoOutline),
              title: Text("About"),
              onTap: () => Navigator.pushNamed(context, "/settings/about"),
            ),
          ],
        )
      ],
    );
  }
}
