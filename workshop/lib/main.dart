import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/pages/gps_page.dart';
import 'package:workshop/pages/home/home_page.dart';
import 'package:workshop/pages/list_page.dart';
import 'package:workshop/pages/webview_page.dart';
import 'package:workshop/providers/settings_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Settings(),
    child: const MyApp(),
  ));
}

class UserData extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: Provider.of<Settings>(context).themeMode,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightBlue,
        brightness: Brightness.dark,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyHomePage(),
        '/webview': (context) => const WebviewPage(),
        '/gps': (context) => const GpsPage(),
        '/list': (context) => const ListPage(),
      },
    );
  }
}
