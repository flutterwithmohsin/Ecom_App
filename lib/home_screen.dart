import 'package:ecom_store/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        automaticallyImplyLeading: false,
        title: Text(AppConstant.appMainName, style: TextStyle(fontWeight: FontWeight.bold,color: AppConstant.appTextColor),),
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
          width: double.maxFinite,
          height: 150,
          color: Colors.redAccent,
          child: Center(child: Text("Mango Shake",style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),)),
        );
      }),
    );
  }
}
