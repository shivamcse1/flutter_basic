import 'dart:convert';

import 'package:first_app/Api_links/allApiLinks.dart';
import 'package:first_app/EmployeeModule/EmployeeScreen.dart';
import 'package:first_app/Model/employeeApimodel.dart';
import 'package:http/http.dart' as http;
class EmployeeMethod{


  var employeeData ;
  Future GetEmployeeData() async{

      try{
          Uri uriUrl= Uri.parse(APILinks.EmployeeListApiUrl);
          var  response = await http.get(uriUrl);

          if(response.statusCode==200){
            var jasonFormat=EmployeeModel.fromJson(jsonDecode(response.body));
            
              employeeData=jasonFormat ;  
              
          }
      }
      catch(err){
          print(err);
      }
  }


  Future AddEmployeeData() async{
  
   try{
     Uri uriUrl= Uri.parse(APILinks.EmployeeCreateUrl);
    var response=  await http.post(uriUrl,
    body: { 
            "employee_name": employee_name.text.toString(),
            "employee_salary": employee_salary.text.toString(),
            "employee_age": employee_age.text.toString(),
            "profile_image": ""
         }
    );
    var jasonFormat=jsonDecode(response.body);
    if(response.statusCode==200){
      print("Successful posted");
      print(response.body);
    }
   }
   catch(err){
    print(err);
   }
  }

  DeleteEmployeeData(){

  }


  UpdateEmployeeData(){

  }
}