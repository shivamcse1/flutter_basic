import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  State<BottomNavigationScreen> createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedItem = 0;

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        toolbarHeight: 40,
        title: Container(
            child: Text(
          "Navigation Bar",
          style: TextStyle(
            color: Colors.black,
          ),
        )),
      ),
      body: Center(
        child: Text(
          "Home data",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
                color: Colors.black,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                color: Colors.black,
              ),
              label: "New Post"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection,
                color: Colors.black,
              ),
              label: "Reel"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
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
  void _OnTapFunction(int index) {
    setState(() {
      print("{$_selectedItem}");
      _selectedItem = index;
    });
  }
}
