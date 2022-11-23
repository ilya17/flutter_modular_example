import 'package:flutter_first_app/app/app_controller.dart';
import 'package:flutter_first_app/app/core/app_state.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../features/main/main_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AppState()),
    Bind.lazySingleton((i) => AppController(i<AppState>()))
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute,
      module: MainModule(),),
  ];
}