import 'package:flutter/cupertino.dart';
import 'package:flutter_first_app/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../features/main/main_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends ModularState<App, AppController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        theme: CupertinoThemeData(
            brightness: controller.isDarkMode ? Brightness.dark : Brightness.light),
        home: MainPage());
  }
}