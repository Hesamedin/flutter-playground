import 'package:flutter/material.dart';
import 'package:flutter_playgound/AppRouter.dart';
import 'package:flutter_playgound/scenes/networkTest/netwotk.dart';
import 'package:go_router/go_router.dart';

class NetworkTester extends StatefulWidget {
  const NetworkTester({Key? key}) : super(key: key);

  static String get path => '/NetworkTester';

  @override
  State<NetworkTester> createState() => _NetworkTesterState();
}

class _NetworkTesterState extends State<NetworkTester> {
  final NetworkManager _networkManager = NetworkManager();

  bool _isRunning = false;

  void _callAPI() async {
    if(_isRunning) return;
    setState(() {
      _isRunning = true;
    });

    print('Calling API...');
    await _networkManager.testHttpPost();
    setState(() {
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Tester'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_isRunning ? 'API called wait for a few minutes...' : 'Tap on the button to call the API'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _callAPI,
        tooltip: 'Call API',
        child: Icon(_isRunning ? Icons.upload : Icons.download),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

