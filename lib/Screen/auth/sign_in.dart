import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/auth/controller/login_controller.dart';
import 'package:shashwat/Screen/auth/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscure = true;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("./images/backin.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 76),
                  Container(
                    // margin: const EdgeInsets.only(
                    //     top: 20, left: 60, right: 30, bottom: 5),
                    padding: const EdgeInsets.all(12.0),
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      // image: DecorationImage(
                      //     image: AssetImage("images/shashwat1.png"),
                      //     fit: BoxFit.fill)
                    ),
                    child: const Image(
                      image: AssetImage("images/shashwat1.png"),
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Times New Roman",
                        color: Color(0xFF033d73),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 16, top: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF033d73),
                              )),
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          onSaved: (value) {
                            controller.email = value!;
                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16, bottom: 20),
                        child: TextFormField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF033d73),
                            ),
                            // hintStyle: const TextStyle(
                            //   fontFamily: "Times New Roman",
                            // ),
                            suffixIcon: IconButton(
                              color: const Color(0xFF033d73),
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                          // keyboardType: TextInputType.visiblePassword,
                          controller: controller.passwordController,
                          onSaved: (value) {
                            controller.pass = value!;
                          },
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 12),
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    return controller.isLoading.isTrue
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(
                                color: Colors.amber,
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  final isValid =
                                      loginFormKey.currentState!.validate();
                                  if (!isValid) {
                                    return;
                                  }
                                  loginFormKey.currentState!.save();
                                  controller.hitLoginApi();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 26),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF033d73),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(14.0),
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontFamily: "Times New Roman",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(width: 26),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/signUp');
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF033d73),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(14.0),
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontFamily: "Times New Roman",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
