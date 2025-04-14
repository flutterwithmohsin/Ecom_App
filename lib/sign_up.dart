import 'package:ecom_store/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import 'app_constant.dart';
import 'sign_up_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final SignUpController signUpController=Get.put(SignUpController());
  final TextEditingController userEmail =TextEditingController();
  final TextEditingController userName =TextEditingController();
  final TextEditingController userPhone =TextEditingController();
  final TextEditingController userAddress =TextEditingController();
  final TextEditingController userPassword =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible){
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppConstant.appScendoryColor,
          title: Text('Sign Up',
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
                  margin: EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  // color: AppConstant.appMainColor,
                  width: Get.width,
                  child: Text('Happy Shopping' ,style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: 25,),
                Container(
                  child:Column(
                    spacing: 20,
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

                      // Username
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24,),
                        child: TextFormField(
                          controller: userName,
                          decoration: InputDecoration(
                              hintText: 'UserName',
                              prefixIcon: Icon(Icons.person_2_outlined),
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

                      // Phone
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          controller: userPhone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            prefixIcon: Icon(Icons.phone_outlined),
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

                      // Address
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          controller: userAddress,
                          minLines: 1,
                          maxLines: 2,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            hintText: 'Address',
                            prefixIcon: Icon(Icons.location_on_outlined),
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
                      // Passwrd
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Obx(()=>TextFormField(
                          controller: userPassword,
                          obscureText: signUpController.isPasswordVisible.value,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: GestureDetector(
                                onTap: (){
                                 signUpController.isPasswordVisible.toggle() ;
                                },
                                child:signUpController.isPasswordVisible.value ?
                                Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined)),
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

                      // -------Sign-IN-BUtton-----------
                      GestureDetector(
                        onTap: ()async{
                          String name=userName.text.trim();
                          String email=userEmail.text.trim();
                          String phone=userPhone.text.trim();
                          String city=userAddress.text.trim();
                          String password=userPassword.text.trim();

                          if(name.isEmpty ||email.isEmpty|| phone.isEmpty|| city.isEmpty||password.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please Fill in all Fields',style: TextStyle(color: AppConstant.appTextColor),),
                                backgroundColor: AppConstant.appMainColor,
                              ),
                            );
                          }
                          else {
                            UserCredential ? userCredential =await signUpController.signUpMethod(
                                name, email, phone, city, password,);
                            if (userCredential != null) {
                              Get.snackbar(
                                  'Verfication Email Sent', 'Check your Inbox',
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: AppConstant.appTextColor,
                                  backgroundColor: AppConstant.appMainColor);
                              FirebaseAuth.instance.signOut();
                              Get.to(() => SignIn());
                            }
                          }
                        },
                        child:
                        Container(
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
                        padding: const EdgeInsets.only(top: 0),
                        child: Center(
                            child: RichText(text: TextSpan(text: "Already have an account?" ,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: AppConstant.appMainColor,
                            ),
                                children: [

                                  TextSpan(text: ' Sign In',recognizer: TapGestureRecognizer()
                              ..onTap=(){
                                Get.offAll(()=>SignIn());
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
