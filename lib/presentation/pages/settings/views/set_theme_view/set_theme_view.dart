import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik/presentation/cubit/theme/theme_cubit.dart';
import 'package:svik/presentation/themes/app_theme.dart';

class SetThemeView extends StatelessWidget {
  const SetThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Theme"),
      ),
      body: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return Column(
            children: [
              CheckboxListTile(
                title: Text("Light"),
                value: state == ThemeMode.light,
                onChanged: (v) {
                  context.read<ThemeCubit>().switchToLight();
                },
              ),
              CheckboxListTile(
                title: Text("Dark"),
                value:  state == ThemeMode.dark,
                onChanged: (v) {
                  context.read<ThemeCubit>().switchToDark();
                },
              ),
              CheckboxListTile(
                title: Text("System Default"),
                value: state == ThemeMode.system,
                onChanged: (v) {
                  context.read<ThemeCubit>().switchToSystemDefault();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
