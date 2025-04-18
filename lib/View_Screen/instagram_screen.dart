// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: use_key_in_widget_constructors
class InstagramScreen extends StatefulWidget {
  @override
  State<InstagramScreen> createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {
  int _selectedItem = 0;
  bool value = true;

  // ignore: non_constant_identifier_names
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!app bar related enviornment
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 50,
        backgroundColor: Colors.black,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Instagram",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            InkWell(
              onTap: () {},
              child: const Icon(Icons.arrow_drop_down),
            )
          ],
        ),

        //! by default action row me hi consider karta widget ko aur alingment bhi right me hai by default
        actions: [
          IconButton(
            iconSize: 25,
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            iconSize: 25,
            onPressed: () {},
            icon: const Icon(Icons.send),
            padding: const EdgeInsets.only(right: 10),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(children: [
          //! for stories
          Container(
            color: Colors.pink.shade100,
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: AssetImage(ImgName[0]),
                  ),
                );
              },
              itemCount: 8,
            ),
          ),

          //! for post

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                color: Colors.black,
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                          width: double.infinity,
                          height: 300,
                          color: Colors.red.shade100,
                          child: Image.asset(
                            "assets/images/logo7.jpg",
                            fit: BoxFit.cover,
                          )),
                      const Positioned(
                          bottom: 3,
                          right: 10,
                          child: Icon(
                            Icons.volume_up,
                            color: Colors.white,
                          )),
                      const Positioned(
                          bottom: 3,
                          left: 10,
                          child: Icon(
                            Icons.file_download,
                            color: Colors.white,
                          ))
                    ]),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              value = false;
                            });
                          },
                          icon: const Icon(Icons.favorite),
                          color: value != false ? Colors.white : Colors.red,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.comment),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                          color: Colors.white,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_border),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Text(
                      "Let us first understand what is flutter- Icons are basically used as symbols in Application.Just think while travelling on road we see Symbols which provides us important information like - there is U turn, Left turn or Right turn",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              );
            },
          )
        ]),
      ),

      //! bottom Navigation bar
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
              ),
              label: "New Post"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection,
              ),
              label: "Reel"),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedItem,
        onTap: _OnTapFunction,
      ),
    );
  }

  //! isse jo icon tab hota hai uska index _selectedItem variable me chala jata hai current index me update ho jat hai
  // ignore: non_constant_identifier_names
  void _OnTapFunction(int index) {
    setState(() {
      // ignore: avoid_print
      print("{$_selectedItem}");
      _selectedItem = index;
    });
  }
}
