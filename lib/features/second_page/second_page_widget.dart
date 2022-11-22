import 'package:flutter/cupertino.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  static Route<dynamic> route() {
    return CupertinoPageRoute(
      builder: (BuildContext context) {
        return SecondRoute();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoNavigationBarBackButton(
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          child: Center(
            child: Text('Тут у нас второая странца'),
          ),
        ));
  }
}