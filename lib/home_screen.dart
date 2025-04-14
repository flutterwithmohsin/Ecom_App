import 'package:ecom_store/app_constant.dart';
import 'package:ecom_store/banner_widget.dart';
import 'package:ecom_store/welcom_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: ()async{
              GoogleSignIn googlesignin=GoogleSignIn();
             await  googlesignin.signOut();
              await FirebaseAuth.instance.signOut();
              Get.offAll(()=>WelcomScreen());
            },
            child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.logout_outlined,color: Colors.white,)),
          )
        ],
        automaticallyImplyLeading: false,
        title: Text(AppConstant.appMainName, style: TextStyle(fontWeight: FontWeight.bold,color: AppConstant.appTextColor),),
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 15,),
            BannerWidget(),
          ],
        ),
      )
    );
  }
}
