import 'package:ecom_store/app_constant.dart';
import 'package:ecom_store/google_signin_controller.dart';
import 'package:ecom_store/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:lottie/lottie.dart';

class WelcomScreen extends StatelessWidget {
   WelcomScreen({super.key});
 final GoogleSignInController googleSignInController=Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appScendoryColor,
        title: Text('Welcome',
          style: TextStyle(
              fontWeight: FontWeight.bold,
               fontSize: 23,
            color: AppConstant.appTextColor,
          ),),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: AppConstant.appMainColor,
              width: Get.width,
              child: Lottie.asset('assets/splash-icon.json'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Happy Shoping' ,style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 80,),
            // Google Sign INNNNN
            GestureDetector(
              onTap: (){
                googleSignInController.signInWithGoogle();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppConstant.appMainColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                height: Get.height/10.5,
                width: Get.width/1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/final-google-logo.png', height: 34,width: 35,),
                    SizedBox(width: 25,),
                    Text('Sign in with Google', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppConstant.appTextColor
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Get.to(()=>SignIn());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppConstant.appMainColor,
                    borderRadius: BorderRadius.circular(15)
                ),
                height: Get.height/10.5,
                width: Get.width/1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined,size: 35,color: AppConstant.appTextColor,),
                    SizedBox(width: 25,),
                    Text('Sign in with Email', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppConstant.appTextColor
                    ),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}