import 'dart:async';
import 'package:ecom_store/app_constant.dart';
import 'package:ecom_store/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay navigation to the next screen
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => WelcomScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appScendoryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation section
            Expanded(
              child: Center(
                child: Lottie.asset(
                  'assets/splash-icon.json',
                  width: Get.width,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      "Animation Failed to Load",
                      style: TextStyle(color: Colors.red),
                    );
                  },
                ),
              ),
            ),

            // Powered by text
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppConstant.appTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
