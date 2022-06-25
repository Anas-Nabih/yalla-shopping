import 'package:flutter/material.dart';
import 'package:yalla_shopping/presentation/res/app_theme.dart';


class MyApp extends StatefulWidget {

  MyApp._internal();

  int appState = 0;
  //singleton or single instance
  static final MyApp _instance = MyApp._internal();

  factory MyApp()=>_instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
    );
  }
}