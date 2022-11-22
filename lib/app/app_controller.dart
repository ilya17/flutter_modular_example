import '../../app/core/app_state.dart';

class AppController {
  final AppState _appState;

  AppController(this._appState);

  bool get isDarkMode => _appState.isDarkMode.value;
}