// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:first_app/EmployeeModule/EmployeeMethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
       
        return EmployeeScreenState();
  }
}

EmployeeMethod employee = new EmployeeMethod();
TextEditingController employee_name=TextEditingController();
TextEditingController employee_salary=TextEditingController();
TextEditingController employee_age=TextEditingController();
TextEditingController employee_image=TextEditingController();

class EmployeeScreenState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

        /// for App Bar
        appBar: AppBar(
          
          toolbarHeight: 55,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "WhatsApp",
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]
     )
    ),



     body: Center(
       child: Column(
        children: [
       
          Container(
            width: 300,
            child: TextField( 
              decoration: InputDecoration(
               hintText: "Enter Employee Name"

              ),
            
              controller:employee_name,
             ),
          ),
         
       
         Container(
            width: 300,
            child: TextField( 
            decoration: InputDecoration(
               hintText: "Enter Employee Salary"

              ),
              controller:employee_salary,
             ),
          ),
       
          Container(
            width: 300,
            child: TextField( 
            decoration: InputDecoration(
               hintText: "Enter Employee age"

              ),
              controller:employee_age,
             ),
          ),
       
          Container(
            width: 300,
            child: TextField( 
            decoration: InputDecoration(
               hintText: "Enter Employee image"
               
              ),
              controller:employee_image,
              
             ),
          ),
       
          

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: (){
             
                employee.AddEmployeeData();
            }, 
            child: Text("Submit")
            
            )
        ],
       
       ),
     ),


    );
  }
  
}