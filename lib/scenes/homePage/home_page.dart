import 'package:flutter/material.dart';
import 'package:flutter_playgound/AppRouter.dart';
import 'package:flutter_playgound/widgets/screenContainer/app_scaffold.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String get path => '/';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      screenName: 'Flutter Demo Home Page',
      child: Wrap(
        spacing: 8.0,
        children: <Widget>[
          ElevatedButton(onPressed: () => AppRouter.showNetworkTesterScene(context), child: const Text('Network Tester')),
          const SizedBox(height: 16.0),
          ElevatedButton(onPressed: () => AppRouter.showUrlFinderScene(context), child: const Text('URL In Text')),
        ],
      ),
    );
  }
}
