import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        margin:const EdgeInsets.only(
          top: 155,
        ),
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
                height: 70,
                width: 60,
                color: Colors.deepOrange,
                child: Image.asset("assets/images/logo2.png")),

            Container(
              margin:const EdgeInsets.only(top: 45),
              child:const  Text(
                "Log In Now",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 3, 91, 124),
                    fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin:const EdgeInsets.only(top: 5),
              child: const Text("Please login to continue using our app",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue)),
            ),

            // first Text Field
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: 270,
              height:50,
              child: TextFormField(
                onChanged: (String value) =>  _formKey.currentState?.validate(),
                validator: (value) =>
                    value == "" ? null : "please enter correct email",
                decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(0),
                    hintText: "Email",
                    hintStyle: const TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),

            // 2nd text Field
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 270,
              height:50,
              child: TextFormField(
              obscureText: isVisible,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        isVisible = !isVisible;
                        setState(() {});
                      },
                      icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility),
                    ),
                    // contentPadding: const EdgeInsets.only(left: 5),
                    hintText: "Password",
                    hintStyle: const TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),

            Container(
              margin:const EdgeInsets.only(left: 170, bottom: 20),
              child: const Text("Forgot Password",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500)),
            ),

            Container(
              width: 270,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child:const Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),

            Container(
                margin:const EdgeInsets.only(top: 13),
                child: RichText(
                    text:const TextSpan(children: [
                  TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue)),
                  TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ]))),

            Container(
              margin:const EdgeInsets.only(top: 15, bottom: 20),
              child:const Text("Or connect with",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500)),
            ),

            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(Icons.mail),
            //     Icon(Icons.facebook),
            //     Icon(Icons.phone,)
            //   ],
            //  )
          ]),
        )),
      ),
    ));
  }
}
