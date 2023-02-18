import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shashwat/Screen/dashboard/dashboard.dart';
import 'package:shashwat/Screen/auth/loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("./images/backin.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            //    mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    // width: double.infinity,
                    margin: EdgeInsets.only(top: 130),
                    decoration: const BoxDecoration(
                      // color: Colors.white,
                      //  color: Color(0xFFff8000),
                      color: Color(0xFF033d73),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                    ),
                    padding: const EdgeInsets.only(
                        left: 30.0, bottom: 16, right: 30, top: 16),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white

                          // color: Color(0xFFff8000),
                          ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 70.0, bottom: 0, top: 80),
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Color(0xFF033d73),
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Times New Roman",
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                          bottomRight: Radius.circular(80)),
                    ),
                    margin: const EdgeInsets.only(right: 80.0),
                    // height: 400,
                    width: double.infinity,

                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 0, left: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "Username",
                                labelStyle: TextStyle(
                                    color: Color(0xFF033d73), fontSize: 18),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xFF033d73),
                                  size: 26,
                                )),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: const Color(0xFFff8000),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    color: Color(0xFF033d73), fontSize: 18),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xFF033d73),
                                  size: 26,
                                )

                                // hintStyle: const TextStyle(
                                //   fontFamily: "Times New Roman",
                                // ),
                                ),
                            //  keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: const Color(0xFFff8000),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "Email Address",
                                labelStyle: TextStyle(
                                    color: Color(0xFF033d73), fontSize: 18),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xFF033d73),
                                  size: 26,
                                )

                                // hintStyle: const TextStyle(
                                //   fontFamily: "Times New Roman",
                                // ),
                                ),
                            //  keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 282,
                    top: 67,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF033d73),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(14.0),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 50,
                          )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
