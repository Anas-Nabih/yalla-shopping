import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yalla_shopping/common_utils/res/app_theme.dart';
import 'package:yalla_shopping/common_utils/res/routes.dart';


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
    return Sizer(
      builder: (context, orientation, deviceType) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: appTheme(),
      ),
    );
  }
}
