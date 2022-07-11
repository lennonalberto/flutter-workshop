import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _setTheme(ThemeMode? mode) {
      Provider.of<Settings>(context, listen: false).setTheme(mode);
    }

    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text(
              "Tema",
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text("Claro"),
                  value: ThemeMode.light,
                  groupValue: Provider.of<Settings>(context).themeMode,
                  onChanged: _setTheme,
                ),
                RadioListTile(
                  title: const Text("Escuro"),
                  value: ThemeMode.dark,
                  groupValue: Provider.of<Settings>(context).themeMode,
                  onChanged: _setTheme,
                ),
                RadioListTile(
                  title: const Text("Sistema"),
                  value: ThemeMode.system,
                  groupValue: Provider.of<Settings>(context).themeMode,
                  onChanged: _setTheme,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
