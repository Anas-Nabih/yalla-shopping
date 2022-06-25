import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yalla_shopping/presentation/main/main_view.dart';
import 'package:yalla_shopping/presentation/onboarding/onboarding_view.dart';
import 'package:yalla_shopping/presentation/splash/splash_view.dart';
import 'package:yalla_shopping/presentation/store_details/store_details_view.dart';
import 'package:yalla_shopping/presentation/user/forget_password/forget_password_view.dart';
import 'package:yalla_shopping/presentation/user/login/login_view.dart';
import 'package:yalla_shopping/presentation/user/register/register_view.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingView= "/onBoardingView";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return CupertinoPageRoute(builder: (context) => const SplashView(),);
      case Routes.loginRoute:
        return CupertinoPageRoute(builder: (context) => const LoginView(),);
        case Routes.onBoardingView:
        return CupertinoPageRoute(builder: (context) => const OnBoardingView(),);
      case Routes.registerRoute:
        return CupertinoPageRoute(builder: (context) => const RegisterView(),);
      case Routes.forgetPasswordRoute:
        return CupertinoPageRoute(builder: (context) =>const  ForgetPasswordView(),);
      case Routes.mainRoute:
        return CupertinoPageRoute(builder: (context) => const MainView(),);
      case Routes.storeDetailsRoute:
        return CupertinoPageRoute(builder: (context) => const StoreDDetailsView(),);
     default:
    return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute ()=>CupertinoPageRoute(builder: (context) => Scaffold(
    appBar: AppBar(title: const Text("No Route Find")),
    body:const Center(child:Text("PLease check your navigation route")),
  ),);
}