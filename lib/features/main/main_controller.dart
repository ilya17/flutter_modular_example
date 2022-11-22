import '../../app/core/app_state.dart';

class MainController {
  final AppState _appState;

  MainController(this._appState);

  bool get isDarkMode => _appState.isDarkMode.value;

  void changeThemeMode() {
    _appState.isDarkMode.value = !_appState.isDarkMode.value;
  }
}