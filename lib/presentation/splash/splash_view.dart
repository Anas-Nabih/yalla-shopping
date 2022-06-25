import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yalla_shopping/presentation/res/app_constatnts.dart';
import 'package:yalla_shopping/presentation/res/assets_manager.dart';
import 'package:yalla_shopping/presentation/res/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  
  _startDelay(){
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), ()=>_goToNextScreen());
  }


  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(AssetsManager.splashLogo),
        ),
      ),
    );
  }

  void _goToNextScreen() => Navigator.pushReplacementNamed(context, Routes.onBoardingView);
}
