
import 'dart:convert';

import 'package:first_app/Api_links/allApiLinks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<StatefulWidget> createState() {
    return EmployeeListState();
  }
}

 bool isLoading=false;

 final List ImgName = [
    'assets/images/logo1.jpg',
    'assets/images/logo2.png',
    'assets/images/logo3.png',
    'assets/images/logo4.jpeg',
    'assets/images/logo5.jpg',
    'assets/images/logo6.jpg',
    'assets/images/logo7.jpg',
    'assets/images/logo1.jpg',
    'assets/images/logo2.png',
    'assets/images/logo3.png',
    'assets/images/logo4.jpeg',
    'assets/images/logo5.jpg',
    'assets/images/logo6.jpg',
    'assets/images/logo2.png',
    'assets/images/logo3.png',
    'assets/images/logo4.jpeg',
    'assets/images/logo5.jpg',
    'assets/images/logo6.jpg',
    'assets/images/logo7.jpg',
    'assets/images/logo7.jpg'
  ];

 
class EmployeeListState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
      print(EmployeeAPiData.length);
    return Scaffold(
      //!-----App Bar

      appBar: AppBar(
        backgroundColor: Colors.amber.shade200,
        title: const Text(
          "Home Screen",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),

      //!--- Drawer in application
      drawer: Drawer(
        backgroundColor: Colors.pink,
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              color: Colors.blue,
            ),
          ],
        ),
      ),

      //!------ Floating Action Button

      floatingActionButton:
      isLoading!=true ? 
        FloatingActionButton(
        onPressed: () async {
         
          setState(() {
            isLoading=true;
          });
          
          await EmployeeList(APILinks.EmployeeListApiUrl);

         setState(() {  
           isLoading=false;
         });

        },
        backgroundColor: Colors.pink.shade200,
        child: const Icon(Icons.add),
        elevation: 10,
      )
      :const Center(
        child:  CircularProgressIndicator(
         
        ),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              //!--- comparison
              itemCount: EmployeeAPiData["data"]?.length??0,
          
            itemBuilder: (context,index){
             
             return ListTile(
              leading: CircleAvatar(
                backgroundImage: index>=ImgName.length?AssetImage(ImgName[0]):AssetImage(ImgName[index]),
              ),
              title:Text(EmployeeAPiData["data"][index]["employee_name"].toString()),
              subtitle:Text(EmployeeAPiData["data"][index]["employee_salary"].toString()),
              trailing: Text(EmployeeAPiData["data"][index]["employee_age"].toString()),
             );
                    
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 5,);
            },
            )
          ],
        ),
      ),


    );

  }

//!--------- Api calling function


  var EmployeeAPiData={};

 Future EmployeeList (String Org_Url) async {
   
   try{
    var Uri_url=Uri.parse(Org_Url);

    //!--- Api Calling start......
    var response= await http.get(Uri_url);
    if(response.statusCode==200){

      var Injasonformat= json.decode(response.body);
      EmployeeAPiData= Injasonformat ;
    }
    else{
      throw Exception("Exception Occured:${response.statusCode}");
    }
   }
    catch (e){
      print("$e");
    }
  }
}