import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_basket/main.dart';
import '../../../core/utils/extension.dart';
import '../../../gen/assets.gen.dart';
import '../../auth/screens/login_screen.dart';
import '../../global/connectivity_screen.dart';
import '../../global/custom_image.dart';

import '../../../core/services/connectivity_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    ConnectivityService.i.init();
    init();
    super.initState();
  }

  init() async {
    final result = await Connectivity().checkConnectivity();
    Timer(3.seconds, () async {
      if (result == ConnectivityResult.none) {
        Navigator.of(navigator.currentContext!).push(MaterialPageRoute(builder: (context) => const ConnectivityScreen()));
      } else {
        Navigator.of(navigator.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomImage(
        Assets.svg.logo,
        height: 200.h,
      ).center,
    );
  }
}
