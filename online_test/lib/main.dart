import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_test/data/modules/homescreen/view.dart';

import 'data/modules/binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreenPage(),
      initialBinding: ControllersBinding(),
    );
  }
}
