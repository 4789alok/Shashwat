import 'package:flutter/material.dart';
import 'package:shashwat/Screen/dashboard/dashboard.dart';
import 'package:shashwat/Screen/auth/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("./images/backin.jpg"), fit: BoxFit.cover),),
        child: Padding(
          padding: const EdgeInsets.only(top: 220.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            //    mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 70.0, bottom: 0),
                child: Text(
                  "Login",
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
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100)),
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
                                ),
                                ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Color(0xFFff8000),
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
                      ],
                    ),
                  ),
                  Positioned(
                    left: 280,
                    top: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                        );
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF033d73),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          padding: const EdgeInsets.all(14.0),
                          child:const Icon(
                            Icons.forward_outlined,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
            const  SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    // color: Colors.white,
                    //  color: Color(0xFFff8000),
                    color: Color(0xFF033d73),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  padding: const EdgeInsets.only(
                      left: 30.0, bottom: 14, right: 30, top: 14),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white
                        // color: Color(0xFFff8000),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
