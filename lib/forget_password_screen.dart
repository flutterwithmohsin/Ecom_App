import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'app_constant.dart';
import 'forget_password_controller.dart';
import 'sign_in.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
 final TextEditingController userEmail =TextEditingController();
 final ForgerPasswordController forgerPasswordController =Get.put(ForgerPasswordController());
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible){
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppConstant.appScendoryColor,
          title: Text('Forget Password',
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
                Container(
                  color: AppConstant.appMainColor,
                  width: Get.width,
                  child: Lottie.asset('assets/splash-icon.json'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Please enter valid Email',
                    style: TextStyle(color: AppConstant.appMainColor,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 20,),
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
                      // Sign____IN BUtton ----------------
                      // ---
                      // -----
                      GestureDetector(
                        onTap: ()async{
                          String email=userEmail.text.trim();
                          if(email.isEmpty){
                            Get.snackbar("Error", "PLease fill in all fields",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appMainColor,
                                colorText: AppConstant.appTextColor);
                          }else{
                           await forgerPasswordController.ForgetPasswordMethod(email);
                              Get.offAll(()=>SignIn());
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
                            child: Text('Reset', style: TextStyle(
                                color: AppConstant.appTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ),
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
