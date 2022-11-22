import 'package:flutter_modular/flutter_modular.dart';

import '../main.dart';
import 'app_widget.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => App()),
  ];
}