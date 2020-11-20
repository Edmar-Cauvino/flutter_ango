import 'package:flutter/material.dart';
import 'package:flutter_ango/loginHome.dart';
import 'loginEnter.dart';
import 'loginScreen.dart';
import 'loginHome.dart';
import 'package:http/http.dart' as http;



Future<void> main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginEnter(),
    );
  }
}

