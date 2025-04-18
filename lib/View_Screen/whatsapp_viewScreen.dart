import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class WhatsapScreen extends StatefulWidget {
  const WhatsapScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WhatsapScreen();
}

class _WhatsapScreen extends State<StatefulWidget> {
  List Arrname = [
    "shivam",
    "karan",
    "pranshu",
    "nitin",
    "adesh",
    "ram",
    "sita",
    "anupam",
    "bharat",
    "adesh",
    "sanvle",
    "kajal",
    "anuj",
    'kalash'
  ];
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

  var UserName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// for App Bar
        appBar: AppBar(
          // toolbarHeight: 0,
          toolbarHeight: 55,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "WhatsApp",
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 3,
                  fontWeight: FontWeight.w400,
                ),
              ),
             
              Container(
                margin: const EdgeInsets.only(left: 200),
                child: IconButton(
                  onPressed: () {
                    Showdilogue();
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 8, 172, 137),
        ),

        // !for main Body of app

        body: ListView.separated(
          itemBuilder: (context, index) {
            // !index milta hai itembuilder me jisse hum item build karwate hain
            return ListTile(

                //*jo item build karwana hai wo retrun me dete hai
                leading: SizedBox(
                  width: 45,
                  height: 45,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(ImgName[index]),
                    backgroundColor: Color.fromARGB(255, 101, 96, 79),
                  ),
                ),
                title: Text(
                  Arrname[index],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text("B.tech"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        Arrname.removeAt(index);
                        setState(() {});
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        UserName.text = Arrname[index];
                        Showdilogue(idx: index);
                      },
                    ),
                  ],
                ));
          },

          itemCount: Arrname.length,
          separatorBuilder: (context, index) {
            return const Divider(
              height: 3,
              thickness: 2,
            );
          }, // jitni baar build karwana hai wo count yaha par dete hains
        ));
  }

  void Showdilogue({int? idx}) {
    showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 10,
          width: 10,
          child: AlertDialog(
            content: TextField(
              controller: UserName,
              decoration: const InputDecoration(
                hintText: "Enter name here",
                hintStyle: TextStyle(fontSize: 18),
              ),
            ),
            title: const Text(
              "You want to add",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            actions: [
              //  for yes Button
              TextButton(
                child: const Text(
                  "Yes",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  idx != null
                      ? {
                          Arrname[idx] = UserName.text,
                          UserName.clear(),
                        }
                      : {
                          Arrname.add(UserName.text),
                          ImgName.add(ImgName[0]),
                          UserName.clear(),
                        };
                  setState(() {});
                  Navigator.pop(context);
                },
              ),

              //  for No Button
              TextButton(
                child: const Text(
                  "No",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }
  
}
