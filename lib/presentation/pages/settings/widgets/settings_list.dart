import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik/presentation/blocs/auth/auth_bloc.dart';
import 'package:svik/presentation/pages/settings/widgets/settings_group.dart';


class SettingsList extends StatelessWidget {
  SettingsList({super.key});

  final Widget divider = const Divider(
    height: 10,
    thickness: 2,
  );

  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SettingsGroup(
          children: [
            ListTile(
              leading: const Icon(EvaIcons.personOutline),
              title: const Text("Account"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(EvaIcons.heartOutline),
              title: const Text("Donate"),
              onTap: () {},
            ),
          ],
        ),
        divider,
        SettingsGroup(
          children: [
            ListTile(
              leading: const Icon(EvaIcons.sunOutline),
              title: const Text("Appearance"),
              onTap: () => Navigator.pushNamed(context, "/settings/theme"),
            ),
          ],
        ),
        divider,
        SettingsGroup(
          children: [
            ListTile(
              leading: const Icon(EvaIcons.questionMarkCircleOutline),
              title: const Text("Help"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(EvaIcons.inboxOutline),
              title: const Text("Invite Friends"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(EvaIcons.infoOutline),
              title: const Text("About"),
              onTap: () => Navigator.pushNamed(context, "/settings/about"),
            ),
          ],
        ),
        divider,
        SettingsGroup(children: [
          ListTile(
            leading: const Icon(
              EvaIcons.logOut,
              color: Colors.red,
            ),
            title: const Text(
              "Log out",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context);
              BlocProvider.of<AuthBloc>(context).add(LogOut());
            },
          ),
        ])
      ],
    );
  }
}
