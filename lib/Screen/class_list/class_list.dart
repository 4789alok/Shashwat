import 'package:flutter/material.dart';
import 'package:shashwat/Screen/auth/sign_in.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';

class ClassListPage extends StatefulWidget {
  const ClassListPage({super.key});

  @override
  State<ClassListPage> createState() => _ClassListPageState();
}

class _ClassListPageState extends State<ClassListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Standard",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
// leading: IconButton(
//           onPressed: (() {
//             Navigator.of(context).pop();
//           }),
//           icon: Icon(Icons.arrow_back_ios),
//           color: Colors.blue,
//         ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,

                  childAspectRatio: 1 / 0.6, // #Size Rasio ke liye use hota h
                ),
                itemCount: classname.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Container(
                      height: 50,
                      //width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFFff8000),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            classname[index]['classes'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Times New Roman",
                            ),
                          ),
                          // ignore: avoid_unnecessary_containers
                        ],
                      ),
                    ),
                  );
                },
                //itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> classname = [
  {
    "classes": "Standard 1",
  },
  {
    "classes": "Standard 2",
  },
  {
    "classes": "Standard 3",
  },
  {
    "classes": "Standard 4",
  },
  {
    "classes": "Standard 5",
  },
  {
    "classes": "Standard 6",
  },
  {
    "classes": "Standard 7",
  },
  {
    "classes": "Standard 8",
  },
  {
    "classes": "Standard 9",
  },
  {
    "classes": "Standard 10",
  },
  {
    "classes": "Standard 11",
  },
  {
    "classes": "Standard 12",
  },
];
