import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desafio/theme/bloc/theme_bloc.dart';

import '../theme/app_themes.dart';

class PreferencesPage extends StatelessWidget {
  PreferencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferences"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          var _itemAppTheme = AppTheme.values[index];
          return Card(
            color: appThemeData[_itemAppTheme]!.primaryColor,
            child: ListTile(
              title: Text(
                _itemAppTheme.toString(),
                style: appThemeData[_itemAppTheme]!.textTheme.bodyMedium,
              ),
              onTap: () {
                BlocProvider.of<ThemeBloc>(context)
                    .add(ThemeChangedEvent(theme: _itemAppTheme));
              },
            ),
          );
        },
      ),
    );
  }
}