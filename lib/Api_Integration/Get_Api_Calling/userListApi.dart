import 'package:first_app/Model/userModel.dart';
import 'package:first_app/Api_links/allApiLinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return UserListState();
  }
}
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

String SelectedValue="";
bool isLoading=false;
class UserListState extends State <StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

        //!-----App Bar

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
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

      //!------ dropdown  button 
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () async{
            
               isLoading=false;
                setState(() {
              
                   });
               await UserList(APILinks.UserApiUrl);
               isLoading=true;
               setState(() {
                 
               });
            
              
            },
             
            child: Text("Get Api Data",style: TextStyle(color: Colors.white),),
            
            ),
        
           isLoading? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount:userWithModel.length,
              shrinkWrap: true,
              itemBuilder:(context,index){
                return ListTile(
        
                  leading: CircleAvatar(
                    backgroundImage: index>=ImgName.length?AssetImage(ImgName[0]):AssetImage(ImgName[index]),),

                    title: Text(userWithModel[index].address!.geo!.lat.toString()),
                    subtitle: Text("$index"+userWithModel[index].website.toString()),
                    trailing: Text(userWithModel[index].email.toString()),
                  
                );
              }
              
              ):CircularProgressIndicator(
                color: Colors.pink,
              )
          ],
        ),
      )
      

    );
  }
   

   //! Api calling method defined
 List<UserModel> userWithModel=[];
   Future  UserList (String orgUrl) async{

      try{
        var uriUrl=Uri.parse(orgUrl);

         var response=await http.get(uriUrl);
         if(response.statusCode==200){

          var jasonFormat=jsonDecode(response.body);
          for(int i=0;i<jasonFormat.length;i++){
               
               userWithModel.add(UserModel.fromJson(jasonFormat[i]));
          }
         }
         else{
          throw Exception("Error Occured:${response.statusCode}");
         }
        

      }
      catch(error){
        print("$error");

      }

     }

     
 }
  
