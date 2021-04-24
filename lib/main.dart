import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/home/presenter/presenter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomeInjection(),
    );
  }
}
