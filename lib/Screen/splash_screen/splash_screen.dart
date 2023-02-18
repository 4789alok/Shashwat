import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/constant/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    box.writeIfNull('isLogedIn', false);

    Timer(const Duration(seconds: 1), () {
      checkifLogedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.center,
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
        const Image(
          image: AssetImage(
            "./images/shashwat1.png",
          ),
          height: 220,
        ),
      ],
    ));
  }

  void checkifLogedIn() {
    // Get.offAllNamed('/sign_in');
    (box.read('isLogedIn'))
        ? Get.offAllNamed('/dashboard')
        : Get.offAllNamed('/welcomePage');
  }
}
