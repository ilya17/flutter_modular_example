import 'package:flutter/cupertino.dart';
import 'package:flutter_first_app/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends ModularState<App, AppController> {
  @override
  Widget build(BuildContext context) {

    return RxBuilder(
      builder: (_) => CupertinoApp.router(
        theme: CupertinoThemeData(
            brightness:
            controller.isDarkMode ? Brightness.dark : Brightness.light),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      )
    );
  }
}
