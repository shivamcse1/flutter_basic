//import 'package:first_app/Login_screen.dart';
//import 'package:first_app/login_screen.dart';
// import 'package:first_app/button_screen.dart';
//import 'package:first_app/bottomNavigationBar_Screen.dart';
import 'package:first_app/EmployeeModule/EmployeeScreen.dart';
import 'package:first_app/View_Screen/whatsapScreenWithApi.dart';
import 'package:first_app/View_Screen/whatsapp_viewScreen.dart';
//import 'package:first_app/whatsapp_viewScreen.dart';
//import 'package:first_app/whatsapp_viewScreen.dart';
// import 'package:first_app/welcome_screen.dart';
// ignore_for_file: unused_import

import 'package:first_app/Api_Integration/Get_Api_Calling/commentListApi.dart';
import 'package:first_app/Api_Integration/Get_Api_Calling/postListApi.dart';
import 'package:first_app/Api_Integration/Get_Api_Calling/productListApi.dart';
import 'package:first_app/Api_Integration/Get_Api_Calling/employeeListApi.dart';
import 'package:first_app/Api_Integration/Get_Api_Calling/userListApi.dart';
import 'package:first_app/View_Screen/flipcart_screen.dart';
import 'package:first_app/View_Screen/home.dart';
import 'package:first_app/View_Screen/instagram_screen.dart';
import 'package:first_app/View_Screen/login_screen.dart';
//import 'package:first_app/instagram_screen.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home",
      theme: ThemeData(
        useMaterial3: true,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade50),
      ),
      home:FlipcartHomeScreen(),
    );
  }
}

/// home Screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text("Home")),
        // backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.amber,
          child: const Center(
            child: Text("hello guys"),
          ),
        ),
      ),
    );
  }
}
