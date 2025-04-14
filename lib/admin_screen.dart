import 'dart:ui';

import 'package:ecom_store/app_constant.dart';
import 'package:ecom_store/welcom_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: ()async{
              GoogleSignIn googleSignIn=GoogleSignIn();
             await googleSignIn.signOut();
             await FirebaseAuth.instance.signOut();
              Get.offAll(()=>WelcomScreen());
            },
            child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.logout_outlined,color: Colors.white,)),
          ),
        ],
        automaticallyImplyLeading: true,
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appScendoryColor,
        title: Text('Admin Pannel',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: AppConstant.appTextColor,
          ),),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: 250,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2), // Semi-transparent white for frosted effect
            borderRadius: BorderRadius.circular(25), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color with transparency
                blurRadius: 10, // Amount of blur for the shadow
                offset: Offset(0, 5), // Offset for the shadow
              ),
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.4), // Slightly opaque white border
              width: 1.5, // Border width
            ),
          ),

        ),
      )
    );
  }
}



