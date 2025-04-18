//import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => ButtonScreenState();
}

var num = 1;

class ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 250, 248, 247),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! for decrement value
            IconButton(
              onPressed: () {
                setState(() {
                  num--;
                });
              },
              icon: Icon(num == 0 ? Icons.menu : Icons.remove),
            ),

            //! value

            Text(
              num.toString(),
              style: TextStyle(color: Colors.black),
            ),

            //! for increment value
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  num++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
