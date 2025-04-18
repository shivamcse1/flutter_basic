import 'dart:convert';

import 'package:first_app/Api_links/allApiLinks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//Mode Specific Function for get API is at the end of this file
var todo = [];
var todo1={};
bool isLoading = false;

Future getDataFromApi() async {
  try {
    var url = Uri.parse(APILinks.todo);
    //! APi Calling  Start
    Response response = await http.get(url);

    //! APi Calling  END
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      todo = jsonData;
      return todo;
    }
  } catch (e) {
    // print("An error occurred: $e");
    throw Exception("An error occurred: $e");
  }
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(
              
            )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //!---Button ------
                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await getDataFromApi();
                      
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child:
                         const  Text("Get", style: TextStyle(color: Colors.white))),

                  //!-------
                  Text(todo1['total'].length.toString()),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todo1['products'].length,
                      itemBuilder: (context, index) {
                        {
                          return ListTile(
                            // title:Text(todo[index].toString()) ,
                            subtitle: Text(todo1['products'][index]['title'].toString()),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
