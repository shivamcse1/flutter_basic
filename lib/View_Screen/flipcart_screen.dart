// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// ignore: use_key_in_widget_constructors
class FlipcartHomeScreen extends StatefulWidget {
  @override
  State<FlipcartHomeScreen> createState() => _FlipcartHomeScreenState();
}

class _FlipcartHomeScreenState extends State<FlipcartHomeScreen> {
  int Idx = 0;
  bool tapbutton = false;
  bool tapSwitchButton = false;
  final List ImgName = [
    'assets/images/logo1.jpg',
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
    'assets/images/logo7.jpg',
    'assets/images/logo2.png',
    'assets/images/logo3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      //!  for app baar
      appBar: AppBar(
        toolbarHeight: 125,
        backgroundColor: Color.fromARGB(255, 221, 204, 204),
        title: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [




                //! flipcart button box
                Expanded(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tapbutton != false
                              ? Colors.blueAccent
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      icon: Image.asset(
                        "assets/icons/flipcart.png",
                        width: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          tapbutton = true;
                        });
                      },
                      label: Text(
                        "Flipcart",
                        style: tapbutton != false
                            ? (TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                            : (TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      )),
                ),

                SizedBox(
                  width: 15,
                ),


                //! Grocery Button box
                Expanded(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              tapbutton != true ? Colors.green : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      icon: Image.asset(
                        "assets/icons/grocery2.png",
                        height: 23,
                        width: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          tapbutton = false;
                        });
                      },
                      label: Text("Grocery",
                          style: tapbutton != true
                              ? (TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                              : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                ),
              ],
            ),


            //! space between button and search bar
            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Brand Mall",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                    Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Color.fromARGB(255, 26, 219, 32),
                        value: tapSwitchButton,
                        onChanged: (bool value) {
                          setState(() {
                            tapSwitchButton = value;
                          });
                        })
                  ],
                ),


                //! space between brand mall and search bar
                SizedBox(width: 15),


                //!--------Search bar

                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here..",
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),

                      //!----prefix icon
                      prefixIcon: Icon(Icons.search_outlined),

                      //!----suffix icon
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.mic_none),
                              ),
                              Icon(Icons.camera_alt_outlined)
                            ]),
                      ),

                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            ///!---first conatiner
            children: [
              Container(
                height: 25,
                width: double.infinity,
                color: Colors.blue,
              ),

              //!---Image 2nd conatiner
              Container(
                width: 250,
                height: 150,
                child: Image.asset(
                  "assets/images/logo1.jpg",
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(
                height: 10,
              ),


              //! third column gridview

              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, index) {
                    return Column(children: [


                      // ! for circleavtar 4th section
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.amber.shade600,
                        backgroundImage: AssetImage(ImgName[0]),
                      ),

                      //  !-------
                      Text("Kitchen")
                    ]);
                  }),


              //!-- 5th section
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.2,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 98,
                        color: Colors.red,
                        child: Image.asset("assets/images/logo4.jpeg"),
                      ),
                      Text("T-Shirts"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 130,
                        child: Image.asset("assets/images/logo6.jpg"),
                      ),
                      Text("Up to Off 70%"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 98,
                        color: Colors.red,
                        child: Image.asset("assets/images/logo7.jpg"),
                      ),
                      Text("Up to Off 50%"),
                    ],
                  ),
                ],
              ),

              //!-- recently viewed store
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 50,
                // color: Colors.amber,
                child: Text(
                  "Recently viewed Store",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),

              //!---------

              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 8, left: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [

                          index>=ImgName.length?Image.asset(ImgName[0],height: 100,):
                          Image.asset(
                            ImgName[index],
                            height: 100,
                          ),
                          Text("Men shoes"),
                        ],
                      ),
                    );
                  },
                  itemCount: 50,
                ),
              )
            ]),
      ),



      //!-- bottom navigation bar item
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Idx,
        onTap: (int pressedIdx) {
          setState(() {
            Idx = pressedIdx;
          });
        },
        backgroundColor: Colors.blue.shade200,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view,), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }
}
