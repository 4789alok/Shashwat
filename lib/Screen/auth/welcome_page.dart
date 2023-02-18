import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/auth/loginpage.dart';
import 'package:shashwat/Screen/auth/sign_in.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({super.key});

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Opacity(
          opacity: 1,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("./images/backin.jpg"), fit: BoxFit.cover),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 20,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                    color: Color(0xFF033d73),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    fontFamily: "Times New Roman"),
              ),
              const SizedBox(height: 130),
              const Image(
                image: AssetImage(
                  "./images/shashwat1.png",
                ),
                height: 220,
              ),
              const SizedBox(
                height: 90,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.offNamed('/signIn');
                  },
                  child: Container(
                    // margin: EdgeInsets.only(left: 40),
                    decoration: const BoxDecoration(
                      color: Color(0xFF033d73),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.all(14.0),
                    child: const Text(
                      "Getting Started",
                      style: TextStyle(
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ?",
                    style: TextStyle(
                        color: Color(0xFFff8000),
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        fontFamily: "Times New Roman"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed('/signIn');
                    },
                    child: const Text(
                      "Log in ",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          fontFamily: "Times New Roman"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
