import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';

class Test_Instruction extends StatefulWidget {
  const Test_Instruction({super.key});

  @override
  State<Test_Instruction> createState() => _Test_InstructionState();
}

class _Test_InstructionState extends State<Test_Instruction> {
  var testID = Get.arguments[0]['testID'];
  var mediumID = Get.arguments[0]['mediumID'];
  var standerID = Get.arguments[0]['standerID'];
  var subjectID = Get.arguments[0]['subjectID'];
  var chapterID = Get.arguments[0]['chapterID'];
  var duration = Get.arguments[0]['duration'];
  var totalMark = Get.arguments[0]['totalMark'];
  var testName = Get.arguments[0]['testName'];
  var date = Get.arguments[0]['date'];
  var time = Get.arguments[0]['time'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF033d73),
        title: const Text(
          'Examination Instructions',
          style: TextStyle(
              //wordSpacing: 4,
              fontSize: 20,
              color: Color(0xFFff8000),
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("./images/backin.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF033d73),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  "The following process takes place when a candidate appears for a remote proctored test.",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
             const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: CustomText(
                      text: '(1)',
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'A suitable device such as a desktop PC, laptop, mobile phone,tablet.',
                      style: TextStyle(
                          //wordSpacing: 4,
                          fontSize: 18,
                          color: Color(0xFF033d73),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: CustomText(
                      text: '(2)',
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'You must use a functioning webcam and microphone.',
                      style: TextStyle(
                          //wordSpacing: 4,
                          fontSize: 18,
                          color: Color(0xFF033d73),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: CustomText(
                      text: '(3)',
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'No cell phones or other secondary devices in the room or test area.',
                      style: TextStyle(
                          //wordSpacing: 4,
                          fontSize: 18,
                          color: Color(0xFF033d73),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: CustomText(
                      text: '(4)',
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'No one else can be in the room with you.',
                      style: TextStyle(
                          //wordSpacing: 4,
                          fontSize: 18,
                          color: Color(0xFF033d73),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: CustomText(
                      text: '(5)',
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'No talking .',
                      style: TextStyle(
                          //wordSpacing: 4,
                          fontSize: 18,
                          color: Color(0xFF033d73),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: CustomText(
                      text: '(6)',
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'The testing room must be well-lit and you must be clearly visible.',
                      style: TextStyle(
                          //wordSpacing: 4,
                          fontSize: 18,
                          color: Color(0xFF033d73),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: CustomText(
                      text: '(7)',
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'No use of additional applications or internet.',
                      style: TextStyle(
                          //wordSpacing: 4,
                          fontSize: 18,
                          color: Color(0xFF033d73),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Get.offNamed('/questionAnswer', arguments: [
                    {
                      'testID': testID.toString(),
                      'mediumID': mediumID,
                      'standerID': standerID,
                      'subjectID': subjectID,
                      'chapterID': chapterID,
                      'duration': duration,
                      'totalMark': totalMark,
                      'testName': testName,
                      'date': date,
                      'time': time,
                    }
                  ]);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF033d73),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    "Proceed",
                    style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
