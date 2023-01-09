import 'package:estados/screens/screen1.dart';
import 'package:flutter/material.dart';

import 'screens/screen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'screen1',
      routes: {
        'screen1' :(context) => const Screen1(),
        'screen2' :(context) => const Screen2(),
      },
    );
  }
}