import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/auth/controller/signup_controller.dart';
import 'package:shashwat/Screen/auth/student_form.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool _isObscure = true;
  bool _secondvar = true;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final controller = Get.find<SignupController>();

  get decoration => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      // leading: IconButton(
      //   onPressed: (() {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => const Sign_in()),
      //     );
      //   }),
      //   icon: Icon(Icons.arrow_back_ios),
      //   color: Colors.blue,
      // ),

      // backgroundColor: Colors.orange.shade100,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("./images/backin.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontFamily: "Times New Roman",
                        fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    //   border: Border.all(color: Colors.grey),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 56.0, right: 20),
                  // height: 400,
                  width: double.infinity,
                  //  color: Colors.white,
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Full name",
                              labelStyle: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF033d73),
                              ),

                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              // )
                            ),
                            keyboardType: TextInputType.name,
                            controller: controller.nameController,
                            onSaved: (value) {
                              controller.name = value!;
                            },
                            validator: (value) {
                              return controller.validateName(value!);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF033d73),
                              ),
                            ),
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
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(0),
                          child: TextFormField(
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF033d73),
                              ),
                              suffixIcon: IconButton(
                                color: Color(0xFF033d73),
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
                            keyboardType: TextInputType.name,
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
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () {
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
                        : GestureDetector(
                            onTap: () {
                              final isValid =
                                  loginFormKey.currentState!.validate();
                              if (!isValid) {
                                return;
                              }
                              loginFormKey.currentState!.save();
                              controller.hitSignupApi(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 24),
                              decoration: const BoxDecoration(
                                color: Color(0xFF033d73),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
