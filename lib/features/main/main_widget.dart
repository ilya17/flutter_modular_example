import 'dart:async';

import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_first_app/features/main/main_controller.dart';
import 'package:flutter_first_app/features/second_page/second_page_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ModularState<MainPage, MainController> {
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: navbar(),
      child: Center(
        child: Container(
            padding: EdgeInsets.all(16),
            child: _loading ? isLoadingWidget() : readyForLoadingWidget()),
      ),
    );
  }

  ObstructingPreferredSizeWidget navbar() {
    return CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.only(bottom: 0.0, left: 10.0),
          onPressed: () {
            _goToNextPage();
          },
          child: Icon(CupertinoIcons.arrow_right),
        ),
        middle: Text('Just Cupertino'),
        trailing: CupertinoButton(
            padding: EdgeInsets.only(bottom: 0.0, right: 10.0),
            onPressed: () => {
              controller.changeThemeMode(),
            },
            child: Icon(controller.isDarkMode
                ? CupertinoIcons.sun_max_fill
                : CupertinoIcons.cloud_moon)));
  }

  Widget isLoadingWidget() {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoProgressBar(
          value: _progressValue,
          valueColor: CupertinoColors.systemGreen,
          trackColor: null,
        ),
        Text(
          '${(_progressValue * 100).round()}%',
          style: TextStyle(color: CupertinoColors.systemGreen, fontSize: 20),
        ),
      ],
    ));
  }

  Widget readyForLoadingWidget() {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Press button to download",
          style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 20),
        ),
        CupertinoButton(
            onPressed: () {
              _updateProgress();
            },
            child: const Icon(
              CupertinoIcons.add_circled_solid,
              size: 50,
            )),
      ],
    ));
  }

  void _updateProgress() {
    setState(() {
      _loading = !_loading;
    });
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _progressValue += 0.1;
      });
      if (_progressValue >= 1.0) {
        _progressValue = 0.0;
        _loading = false;
        t.cancel();
        return;
      }
    });
  }

  void _goToNextPage() {
    Navigator.of(context).push(SecondRoute.route());
  }
}