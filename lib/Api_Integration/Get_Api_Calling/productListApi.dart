// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:first_app/Api_links/allApiLinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

 bool isLoading=false;

 
class ProductListState extends State<StatefulWidget> {
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
          
          await ProductApi(APILinks.ProductListApiUrl);

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

      //! body of application
      /* body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade200,
                ),
                onPressed: () {},
                child: const Text(
                  "Get Api",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        )*/
      //!-------------------

      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(ApiData.length.toString()),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ApiData.length,
              
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(ApiData[index]["title"].toString()),
                  subtitle: Text(ApiData[index]["price"].toString()),
                  trailing: Text(ApiData[index]["rating"].toString()),
                );
              }
              )
          ],
        ),
      ),
    );
  }

 var ApiData=[];

 //!-- Api calling function which call api and get response 
  Future ProductApi(String url) async{

 try{
    // convert original url to Uri Format Kyunki http APi call or hit karne ke liye  url ka Uri format hi accept karta hai
    // Uri format me convert karne pr url ka return type Uri ho jata hai
    var UriUrl=Uri.parse(url);

    
    //!----- API Calling Start.....-----
    //--- after converting in Uri format We call the Api Using http(kyunki http Api call karne me help karta hai aur bhi jisse Api call lari ja sakti hai but It is most famous And Good therefor use this  )
    // Api call karne par humko response milta hai isiliye usko ek variable me store kara lenge jiska Return type response hi hota hai 
     
    // (http.get) is liye hai kyunki ye Api get ki hai agr post ki hoti to (http.post) and so---on .
     var response= await http.get(UriUrl);

     //! Api calling End
     if(response.statusCode==200)
     {
      // sabse pahle jo response aya hai usko jason format me decode kar denge aur wo sara data response class ki body me hota hai , convert karke usko kahi store bhi karana padega isliye store karate hai 
       var jasonDataFormat=json.decode(response.body);

       //store jasonformat data in list for future using
        ApiData=jasonDataFormat["products"];
        return ApiData;
     }
     else{
        
        throw Exception("An Exception Occured:${response.statusCode}");
     }

  } 
  catch(e){

    print("$e");
  }
  }
}
