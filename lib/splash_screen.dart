import 'dart:async';
import 'package:ecom_store/admin_screen.dart';
import 'package:ecom_store/app_constant.dart';
import 'package:ecom_store/get_user_data_controller.dart';
import 'package:ecom_store/home_screen.dart';
import 'package:ecom_store/welcom_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user =FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();

    // Delay navigation to the next screen
    Timer(const Duration(seconds: 3), () {
      loggedIn(context);
    });
  }

  Future<void>loggedIn(BuildContext context)async {
 if(user!=null){
   final GetUserDataController getUserDataController=Get.put(GetUserDataController());
 var userData= await getUserDataController.getUserData(user!.uid);
    if(userData[0]['isAdmin']==true){
      Get.offAll(()=>AdminScreen());
    }else{
      Get.offAll(()=>HomeScreen());
    }
 }else{
   Get.offAll(()=>WelcomScreen());
 }
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
