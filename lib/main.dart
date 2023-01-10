import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/screen1.dart';
import 'screens/screen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'screen1',
      // routes: {
      //   'screen1' :(context) => const Screen1(),
      //   'screen2' :(context) => const Screen2(),
      // },
      getPages: [
        GetPage(name: '/screen1', page: () => const Screen1(),),
        GetPage(name: '/screen2', page: () => const Screen2(),)
      ],
    );
  }
}