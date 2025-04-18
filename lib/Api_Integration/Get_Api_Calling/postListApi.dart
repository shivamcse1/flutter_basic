
// ignore_for_file: sort_child_properties_last

import 'dart:convert';

import 'package:first_app/Api_links/allApiLinks.dart';
import 'package:http/http.dart' as http;

import 'package:first_app/Model/PostsApiModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';


class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<StatefulWidget> createState() {
    return PostListState();
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

 
class PostListState extends State<StatefulWidget> {
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

      floatingActionButton:FloatingActionButton(

        child: const Icon(Icons.add),
       backgroundColor: Colors.pink.shade200,
        onPressed: ()  async{
        setState(() {
            isLoading=true;
          });
          
          await PostList(APILinks.PostListApiUrl);

         setState(() {
           isLoading=false;
         });
          
        },
        elevation: 10,
      ),
    
    body:  ListView.builder(
          itemCount:postListWithModel.length,
          itemBuilder: (context,index)
         {
        
          return ListTile(
            
           title: Text(postListWithModel[index].title.toString(),maxLines: 1,),
           
            
          );
        }  
    )

    );

  }


  //!---- Defining method for Calling Api--------

List<PostsModel> postListWithModel=[];

 var  Posts=[];
  Future PostList (String orgUrl) async{

   try{
        var uriUrl=Uri.parse(orgUrl);

        Response response= await http.get(uriUrl);

        if(response.statusCode==200)
          {
            var jasonFormat= jsonDecode(response.body);//List

            if(jasonFormat is List)
            {
                 //! Without usimg Model
                  Posts=jasonFormat;

                 //! with using Model
                  for (var i = 0; i <jasonFormat.length ; i++) 
                  {
                    postListWithModel.add(PostsModel.fromJson(jasonFormat[i]));
                  }
           
              // jasonFormat.forEach((element) {postListWithModel.add(PostsModel.fromJson(element));});
            }
          }

       else
        {
          throw Exception("${response.statusCode}");
        }  
          
      }
          
    catch(error)
      {
       print("Error occured:$error");
      }
 }
}
