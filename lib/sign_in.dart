import 'package:ecom_store/admin_screen.dart';
import 'package:ecom_store/forget_password_screen.dart';
import 'package:ecom_store/home_screen.dart';
import 'package:ecom_store/sign_in_controller.dart';
import 'package:ecom_store/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'app_constant.dart';
import 'get_user_data_controller.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});
final GetUserDataController getUserDataController=Get.put(GetUserDataController());
final SignInController signInController=Get.put(SignInController());   
TextEditingController userEmail =TextEditingController();
TextEditingController userPassword =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible){
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppConstant.appScendoryColor,
          title: Text('Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: AppConstant.appTextColor,
            ),),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isKeyboardVisible ? SizedBox.shrink():
                Container(
                  color: AppConstant.appMainColor,
                  width: Get.width,
                  child: Lottie.asset('assets/splash-icon.json'),
                ),
               SizedBox(height: 80,),
                Container(
                  child:Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          controller: userEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width:2.5,color: AppConstant.appMainColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Obx(()=>TextFormField(
                          controller: userPassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: signInController.isPasswordVisible.value,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: GestureDetector(
                                onTap: (){
                                  signInController.isPasswordVisible.toggle();
                                },
                                child:
                                signInController.isPasswordVisible.value?
                                Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility_outlined)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width:2.5,color: AppConstant.appMainColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),)
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>ForgetPassword());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 15,right: 24),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text('Forget Password?', style: TextStyle(
                              color:AppConstant.appMainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),),
                          ),
                        ),
                      ),

                      // Sign____IN BUtton ----------------
                      // ---
                      // -----
                      GestureDetector(
                        onTap: ()async{
                          String email=userEmail.text.trim();
                          String password=userPassword.text.trim();
                          if(email.isEmpty||password.isEmpty){
                            Get.snackbar("Error", "PLease fill in all fields",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appMainColor,
                                colorText: AppConstant.appTextColor);
                          }else{
                            UserCredential ? userCredential=await signInController.signInMethod
                              (email, password);
                            if(userCredential!=null && userCredential.user!.emailVerified){
                              var userdata=await getUserDataController.getUserData(userCredential.user!.uid);
                               if(userdata[0]['isAdmin']==true){
                                 Get.offAll(()=>AdminScreen());
                               }
                               else{
                                 Get.snackbar('Success', 'Login SuccessFully',
                                     snackPosition: SnackPosition.BOTTOM,
                                     backgroundColor: AppConstant.appMainColor,
                                     colorText: AppConstant.appTextColor);
                                 Get.offAll(()=>HomeScreen());
                               }
                            }else{
                              Get.snackbar('Email not verified', 'Check your inbox',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appMainColor,
                                  colorText: AppConstant.appTextColor);
                            }
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 27),
                          height: 50,
                          width: Get.width/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppConstant.appMainColor
                          ),
                          child: Center(
                            child: Text('Sign In', style: TextStyle(
                              color: AppConstant.appTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Center(
                          child: RichText(text: TextSpan(text: "Don't have an account?" ,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: AppConstant.appMainColor,
                          ),
                            children: [
                              TextSpan(text: ' Sign Up' ,
                                  recognizer: TapGestureRecognizer()
                            ..onTap=(){
                              Get.to(()=>SignUp());
                            },
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppConstant.appMainColor,))
                            ]
                          ),
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
