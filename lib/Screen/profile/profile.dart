import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/profile/controller/profile_controller.dart';
import 'package:shashwat/constant/constants.dart';

class Profile extends GetView<ProfileController> {
  Profile({super.key}) {
    controller.hitProfileApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
          style: TextStyle(
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white),
        ),
        backgroundColor: const Color(0xFF033d73),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("./images/backin.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Obx(() {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, left: 60, right: 30, bottom: 5),
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
                          padding: EdgeInsets.only(top: 88),
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xFFff8000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.all(14),
                      child: Column(
                        children: [
                          Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Full Name:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 120,
                              // ),
                              Expanded(
                                child: Text(
                                  controller.name.value == ""
                                      ? "...."
                                      : controller.name.value,
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Date Of Birth:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 100,
                              // ),
                              Expanded(
                                child: Text(
                                  controller.dob.value == ""
                                      ? "...."
                                      : controller.dob.value,
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Standard:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 132,
                              // ),
                              Expanded(
                                child: Text(
                                  controller.standard.value == ""
                                      ? "...."
                                      : controller.standard.value,
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Text(
                                  "School Name:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 104,
                              // ),
                              Expanded(
                                child: Text(
                                  controller.schoolName.value == ""
                                      ? "...."
                                      : controller.schoolName.value,
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Recent Percentage:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 70,
                              // ),
                              Expanded(
                                child: Text(
                                  controller.percentage.value == ""
                                      ? "...."
                                      : controller.percentage.value,
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Email id:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 138,
                              // ),
                              Expanded(
                                child: Text(
                                  box.read('email').toString(),
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Mobile Number:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 80,
                              // ),
                              Expanded(
                                child: Text(
                                  controller.phone.value == ""
                                      ? "...."
                                      : controller.phone.value,
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Hobbies:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 80,
                              // ),
                              Expanded(
                                child: Text(
                                  controller.hobbies.value == ""
                                      ? "...."
                                      : controller.hobbies.value,
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Address:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 140,
                              // ),
                              Expanded(
                                child: Text(
                                  controller.address.value == ""
                                      ? "...."
                                      : controller.address.value,
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Pin Code:",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 140,
                              // ),
                              Expanded(
                                child: Text(
                                  controller.pincode.value == ""
                                      ? "...."
                                      : controller.pincode.value,
                                  style: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF033d73)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/editProfile');
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 36),
                        decoration: const BoxDecoration(
                          color: Color(0xFF033d73),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        padding: const EdgeInsets.all(15.0),
                        child: const Text(
                          "Update",
                          style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
