import 'dart:convert';

import 'package:first_app/Api_links/allApiLinks.dart';
import 'package:first_app/Model/employeeApimodel.dart';
// import 'package:first_app/Model/employeeApimodel.dart';
import 'package:first_app/Model/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class WhatsapWithApiScreen extends StatefulWidget {
  const WhatsapWithApiScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WhatsapWithApiScreenState();
}

bool isButtonHit=false;

class _WhatsapWithApiScreenState extends State<StatefulWidget> {
  // // List Arrname = [
  //   "shivam",
  //   "karan",
  //   "pranshu",
  //   "nitin",
  //   "adesh",
  //   "ram",
  //   "sita",
  //   "anupam",
  //   "bharat",
  //   "adesh",
  //   "sanvle",
  //   "kajal",
  //   "anuj",
  //   'kalash'
  // ];
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
    'assets/images/logo7.jpg'
  ];

  var title = TextEditingController();
  var body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// for App Bar
        appBar: AppBar(
          // toolbarHeight: 0,
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
             
              Container(
                margin: const EdgeInsets.only(left: 200),
                child: IconButton(
                  onPressed: () {
                    Showdilogue();
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 8, 172, 137),
        ),

        // !for main Body of app

        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed: () async{
          
                isButtonHit=false;
                setState(() {
                  
                });
          
                await UserGet();
                 
                 isButtonHit=true;
                 setState(() {
                   
                 });
          
                }, 
                child: Text("get data")),
              
                isButtonHit? 
                
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
          
                  // !index milta hai itembuilder me jisse hum item build karwate hain
                  return ListTile(
                      //*jo item build karwana hai wo retrun me dete hai
                      leading: SizedBox(
                        width: 45,
                        height: 45,
                        child: CircleAvatar(
                          backgroundImage: index>=ImgName.length?AssetImage(ImgName[0]) : AssetImage(ImgName[index]),
                          
                        ),
                      ),
          
                      title: Text(userWithModel[index].name.toString()),
                      subtitle: Text(userWithModel[index].email.toString()),
                      );
                },
              
                itemCount: userWithModel.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 3,
                    thickness: 2,
                  );
                }, // jitni baar build karwana hai wo count yaha par dete hains
              )
                : CircularProgressIndicator(),
            ],
          ),
        ));
  }

  void Showdilogue({int? idx}) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(

          child: AlertDialog(
            title: Text("Are you want to add"),
            content: Column(

              children: [

                //! 1st text field
                TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: "Enter Employee name"
                  ),
                  
                ),

                //! 2nd textfield
                  TextField(
                  controller: body,
                  decoration: InputDecoration(
                    hintText: "Enter Employee age"
                  ),
                  
                ),
           
              ],
            ),


            actions: [
              //! for yes button
              TextButton(
                onPressed: () async{

                  print(title.text.toString());
                
                 await AddEmployeeApi();
                 
                  
                  // await UserGet();
                   isButtonHit=true;
                  setState(() {
                    
                  });
                  Navigator.pop(context);

                },
              child:Text("Yes")
              ),

             // !for no button

              TextButton(
                onPressed: (){
                 Navigator.pop(context);

                },
              child:Text("No")
              ),

            ],
          ),
        );
      },
    );
  }


  //! Api calling method defined
 List userWithModel=[];
   Future  UserGet () async{

      try{
 
        var uriUrl=Uri.parse(APILinks.EmployeeListApiUrl);

         var response=await http.get(uriUrl);
         print(response);
         print(response.body);
         if(response.statusCode==200){

          var jasonFormat=jsonDecode(response.body);

            
          //var result=EmployeeModel.fromJson(jasonFormat);
          for(int i=0;i<jasonFormat.length;i++){
               
               userWithModel.add(EmployeeModel.fromJson(jasonFormat[i]).data);
          }

         print(response.body);
         
         }
         else{
          throw Exception("Error Occured:${response.statusCode}");
         }
        

      }
      catch(error){
        print("$error");

      }

     }
 
 
  //! method for Posting Data to Api
  Future AddEmployeeApi() async{

    try{

      // var data={
        
      //     "title":title.text,
      //     "body":body.text,
      // };
      // var bodyy=jsonEncode(data);
      Uri uriUrl=Uri.parse(APILinks.EmployeeCreateUrl);

      var response= await http.post(
        uriUrl,
        body:{

        "name": "test",
        "salary": "123",
        "age": "23"
},
        );
        print(response.body);
     var   resp=jsonDecode(response.body);
        if(response.statusCode==200){
          print(resp['message'].toString());

        }

           }
    catch(error){
          print("$error");
    }
  }
}
