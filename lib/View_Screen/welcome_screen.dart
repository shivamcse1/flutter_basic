import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(Object context) {
   
   return Scaffold(
    // appBar: AppBar(
    //   title:Text("welcome"),
    // ),

    body:Center(
      child:Container(
        margin: EdgeInsets.only(top: 170),
      width:370,
     // color:Colors.red,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
      height:130,
      width:120,
      color:Colors.red,
      child:Image.asset("assets/images/logo2.png"),
    ),

      Container(
        height: 40,
      ),    
      Text("Welcome To",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: const Color.fromARGB(255, 251, 81, 69)),),
      Text("Create an account and access thousand",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.blue),),
      Text("of cool stuffs",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color:Colors.blue),),


      Container(
        margin: EdgeInsets.only(top: 30),
      width:320,
      child:ElevatedButton(

        style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.blue)),
      child:Text('Get Started',style: TextStyle(color: Colors.white),),
      onPressed: (){
         
      },
      ),
      ),

       Container(
        height: 8,
      ),      
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[Text("Do you have an account? ",style:TextStyle(fontSize:10,color: Colors.blue )),
        Text("Log in",style:TextStyle(fontSize:10,color: Colors.black,fontWeight:FontWeight.bold )),
      ],
      ),
    ],
    ),
    ),
    ),
    );
  }

}