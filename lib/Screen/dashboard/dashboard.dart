import 'package:flutter/material.dart';
import 'package:shashwat/Screen/home/home.dart';
import 'package:shashwat/Screen/medium/select_medium.dart';
import 'package:shashwat/Screen/profile/profile.dart';
import 'package:shashwat/Screen/result_subject_wise/select_subjectr.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var currentIndex = 0;
  final screens = [
    Home(),
    Medium(),
    ResultSubjectWise(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          selectedItemColor:const Color(0xFFff8000),
          unselectedItemColor:const Color(0xFF033d73),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 36,
                ),
                label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.text_snippet_sharp,
                size: 36,
              ),
              label: "Tests",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.outbox_sharp,
                size: 36,
              ),
              label: "Result",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 36,
                ),
                label: "Profile"),
          ]),
    );
  }
}
