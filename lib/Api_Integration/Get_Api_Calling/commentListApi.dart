import 'dart:convert';

import 'package:first_app/Model/commentApiModel.dart';
import 'package:first_app/Api_links/allApiLinks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class CommentList extends StatefulWidget {
  const CommentList({super.key});

  @override
  State<StatefulWidget> createState() {
    return CommentListState();
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

 
class CommentListState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {

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
          
          await CommentApi(APILinks.CommentListAPiUrl);

         setState(() {
           isLoading=false;
         });

        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
        elevation: 10,
      )
      :const Center(
        child:  CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:commentApiData.length,
            itemBuilder: (context,index){
             
             return ListTile(
              leading: CircleAvatar(
                backgroundImage: index>=ImgName.length ? (
                  

                AssetImage(ImgName[index])
                
                
                ):AssetImage(ImgName[index]),
              ),
              title:Text(commentApiDataWithModel[index].name.toString(),maxLines: 1,),
              subtitle:Text(commentApiData[index]["email"].toString()) ,
                     
              trailing:Text(commentApiData[index]["id"].toString()) ,
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


 var commentApiData=[];
 List<CommentModel> commentApiDataWithModel=<CommentModel>[];

 Future CommentApi (String Org_Url) async{

    try{
      var Uri_Url=Uri.parse(Org_Url);

      //! Api calling start........ and store response in response variable 
      var response= await http.get(Uri_Url);
      
      if(response.statusCode==200){
    
           var InJasonFormat= json.decode(response.body);
           
           // without using model
           commentApiData=InJasonFormat;
          

          // with Model
          
          for(int i=0;i<InJasonFormat.length;i++){

            commentApiDataWithModel.add(CommentModel.fromJson(InJasonFormat[i]));

          }


      }
      
      else{
        throw Exception("Exception is succesfully Handeld:${response.statusCode}");
      }

    }
    catch(e){
      
      print("$e");
    }
  }
}