import 'package:flutter/material.dart';
import 'app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Museum',
      home: AppBarScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
