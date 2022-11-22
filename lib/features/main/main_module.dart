import 'package:flutter_first_app/features/main/main_controller.dart';
import 'package:flutter_first_app/features/main/main_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app/core/app_state.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AppState()),
    Bind.lazySingleton((i) => MainController(i<AppState>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => MainPage()),
  ];
}