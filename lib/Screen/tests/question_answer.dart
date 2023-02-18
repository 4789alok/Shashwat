import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/tests/controller/question_controller.dart';
import 'package:shashwat/Services/http_service_impl.dart';

class QuestionAnswer extends StatefulWidget {
  const QuestionAnswer({super.key});

  @override
  State<QuestionAnswer> createState() => _QuestionAnswerState();
}

class _QuestionAnswerState extends State<QuestionAnswer> {
  int _value = 0;
  var testID = Get.arguments[0]['testID'];
  final controller = Get.find<QuestionController>();

  Timer? _timer;
  int _start = int.parse(Get.arguments[0]['duration'].toString());
  int min = int.parse(Get.arguments[0]['duration'].toString()) - 1;
  int sec = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    var v = 1;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Get.offNamed('/result', arguments: [
              {
                'testID': testID,
                'subjectID': controller.subjectID,
                'chapterID': controller.chapterID.toString(),
                'testName': controller.testName.toString(),
                'date': controller.date.toString(),
                'time': controller.time.toString(),
              }
            ]);
          });
        } else {
          setState(() {
            v++;
            if (v == 60) {
              v = 1;
              sec = 59;
              min--;
              _start--;
            } else {
              sec--;
            }
          });
        }
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        Get.back();
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Are you sure"),
      content: const Text("Do you want to back this page"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('back button click');
        showAlertDialog(context);
        return false;
      },
      child: Scaffold(
        //  backgroundColor: const Color(0xFF033d73),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Assessment',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold),
              ),
              //SizedBox(width: 90),
              Row(
                children: [
                  Text(
                    // _start.toString(),
                    '$min : $sec',
                    style:const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold),
                  ),
                const  SizedBox(width: 06),
                const Icon(
                    Icons.timer_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: const Color(0xFF033d73),
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color(0xFF033d73),
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14))),
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        '${(controller.count.value)} of ${controller.length.value}',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed('/result', arguments: [
                          {
                            'testID': testID,
                            'subjectID': controller.subjectID,
                            'chapterID': controller.chapterID.toString(),
                            'testName': controller.testName.toString(),
                            'date': controller.date.toString(),
                            'time': controller.time.toString(),
                          }
                        ]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0xFF033d73),
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14))),
                        padding: const EdgeInsets.all(14),
                        child: const Text(
                          'Finish',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Question ${(controller.count.value)}',
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Html(
                          data:
                              """${controller.questionListData[controller.index.value].question.toString()}""",
                          style: {
                            "body": Style(
                                fontSize: const FontSize(18.0),
                                color: Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold),
                          }),
                      ((controller.questionListData[controller.index.value]
                                      .question_image
                                      .toString() ==
                                  'null') ||
                              (controller
                                      .questionListData[controller.index.value]
                                      .question_image
                                      .toString() ==
                                  ''))
                          ? const SizedBox.shrink()
                          : Image(
                              image: NetworkImage(
                                BASE_URL +
                                    controller
                                        .questionListData[
                                            controller.index.value]
                                        .question_image
                                        .toString(),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.width * 0.4,
                            ),
                      // Text(
                      //   controller
                      //       .questionListData[controller.index.value].question
                      //       .toString(),
                      //   style: const TextStyle(
                      //       //wordSpacing: 4,
                      //       fontSize: 18,
                      //       color: Colors.black,
                      //       fontFamily: "Times New Roman",
                      //       fontWeight: FontWeight.bold),
                      // ),
                      const SizedBox(height: 30),
                      ((controller.questionListData[controller.index.value].type
                                      .toString() ==
                                  "MCQ") ||
                              (controller
                                      .questionListData[controller.index.value]
                                      .type
                                      .toString() ==
                                  "Fill In The Blanks"))
                          ? Column(
                              children: [
                                (((controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option1
                                                    .toString() ==
                                                '') ||
                                            (controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option1
                                                    .toString() ==
                                                'null')) &&
                                        ((controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option_image1
                                                    .toString() ==
                                                'null') ||
                                            (controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option_image1
                                                    .toString() ==
                                                '')))
                                    ? const SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          children: [
                                            //  objective type ................

                                            Radio(
                                                activeColor: Colors.black,
                                                value: 1,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _value = value!;
                                                    controller.selectedAnswer
                                                        .value = 'a';
                                                    // controller
                                                    //     .questionListData[
                                                    //         controller
                                                    //             .index.value]
                                                    //     .option1
                                                    //     .toString();
                                                  });
                                                }),
                                            const SizedBox(width: 8),
                                            ((controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option1
                                                            .toString() ==
                                                        '') ||
                                                    (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option1
                                                            .toString() ==
                                                        'null'))
                                                ? const SizedBox.shrink()
                                                : Expanded(
                                                    child: Html(
                                                        data:
                                                            """${controller.questionListData[controller.index.value].option1.toString()}""",
                                                        style: {
                                                          "body": Style(
                                                              fontSize:
                                                                  const FontSize(
                                                                      16.0),
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Times New Roman",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        }),
                                                  ),
                                            ((controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option_image1
                                                            .toString() ==
                                                        '') ||
                                                    (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option_image1
                                                            .toString() ==
                                                        'null'))
                                                ? const SizedBox.shrink()
                                                : Image(
                                                    image: NetworkImage(
                                                      BASE_URL +
                                                          controller
                                                              .questionListData[
                                                                  controller
                                                                      .index
                                                                      .value]
                                                              .option_image1
                                                              .toString(),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                  ),
                                          ],
                                        ),
                                      ),
                                (((controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option2
                                                    .toString() ==
                                                '') ||
                                            (controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option2
                                                    .toString() ==
                                                'null')) &&
                                        ((controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option_image2
                                                    .toString() ==
                                                'null') ||
                                            (controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option_image2
                                                    .toString() ==
                                                '')))
                                    ? const SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          children: [
                                            Radio(
                                                activeColor: Colors.black,
                                                value: 2,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _value = value!;
                                                    controller.selectedAnswer
                                                        .value = 'b';
                                                  });
                                                }),
                                            const SizedBox(width: 8),
                                            (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option2
                                                            .toString() ==
                                                        '') ||
                                                    (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option2
                                                            .toString() ==
                                                        'null')
                                                ? const SizedBox.shrink()
                                                : Expanded(
                                                    child: Html(
                                                        data:
                                                            """${controller.questionListData[controller.index.value].option2.toString()}""",
                                                        style: {
                                                          "body": Style(
                                                              fontSize:
                                                                  const FontSize(
                                                                      16.0),
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Times New Roman",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        }),
                                                  ),
                                            ((controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option_image2
                                                            .toString() ==
                                                        '') ||
                                                    (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option_image2
                                                            .toString() ==
                                                        'null'))
                                                ? const SizedBox.shrink()
                                                : Image(
                                                    image: NetworkImage(
                                                      BASE_URL +
                                                          controller
                                                              .questionListData[
                                                                  controller
                                                                      .index
                                                                      .value]
                                                              .option_image2
                                                              .toString(),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                  ),
                                          ],
                                        ),
                                      ),
                                (((controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option3
                                                    .toString() ==
                                                '') ||
                                            (controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option3
                                                    .toString() ==
                                                'null')) &&
                                        ((controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option_image3
                                                    .toString() ==
                                                'null') ||
                                            (controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option_image3
                                                    .toString() ==
                                                '')))
                                    ? const SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          children: [
                                            Radio(
                                                activeColor: Colors.black,
                                                value: 3,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _value = value!;
                                                    controller.selectedAnswer
                                                        .value = 'c';
                                                  });
                                                }),
                                            const SizedBox(width: 8),
                                            (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option3
                                                            .toString() ==
                                                        '') ||
                                                    (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option3
                                                            .toString() ==
                                                        'null')
                                                ? const SizedBox.shrink()
                                                : Expanded(
                                                    child: Html(
                                                        data:
                                                            """${controller.questionListData[controller.index.value].option3.toString()}""",
                                                        style: {
                                                          "body": Style(
                                                              fontSize:
                                                                  const FontSize(
                                                                      16.0),
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Times New Roman",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        }),
                                                  ),
                                            ((controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option_image3
                                                            .toString() ==
                                                        '') ||
                                                    (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option_image3
                                                            .toString() ==
                                                        'null'))
                                                ? const SizedBox.shrink()
                                                : Image(
                                                    image: NetworkImage(
                                                      BASE_URL +
                                                          controller
                                                              .questionListData[
                                                                  controller
                                                                      .index
                                                                      .value]
                                                              .option_image3
                                                              .toString(),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                  ),
                                          ],
                                        ),
                                      ),
                                (((controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option4
                                                    .toString() ==
                                                '') ||
                                            (controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option4
                                                    .toString() ==
                                                'null')) &&
                                        ((controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option_image4
                                                    .toString() ==
                                                'null') ||
                                            (controller
                                                    .questionListData[
                                                        controller.index.value]
                                                    .option_image4
                                                    .toString() ==
                                                '')))
                                    ? const SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          children: [
                                            Radio(
                                                activeColor: Colors.black,
                                                value: 4,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _value = value!;
                                                    controller.selectedAnswer
                                                        .value = 'd';
                                                  });
                                                }),
                                            const SizedBox(width: 8),
                                            (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option4
                                                            .toString() ==
                                                        '') ||
                                                    (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option4
                                                            .toString() ==
                                                        'null')
                                                ? const SizedBox.shrink()
                                                : Expanded(
                                                    child: Html(
                                                        data:
                                                            """${controller.questionListData[controller.index.value].option4.toString()}""",
                                                        style: {
                                                          "body": Style(
                                                              fontSize:
                                                                  const FontSize(
                                                                      16.0),
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Times New Roman",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        }),
                                                  ),
                                            ((controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option_image4
                                                            .toString() ==
                                                        '') ||
                                                    (controller
                                                            .questionListData[
                                                                controller.index
                                                                    .value]
                                                            .option_image4
                                                            .toString() ==
                                                        'null'))
                                                ? const SizedBox.shrink()
                                                : Image(
                                                    image: NetworkImage(
                                                      BASE_URL +
                                                          controller
                                                              .questionListData[
                                                                  controller
                                                                      .index
                                                                      .value]
                                                              .option_image4
                                                              .toString(),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                  ),
                                          ],
                                        ),
                                      ),
                              ],
                            )
                          : Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(18),
                              child: TextFormField(
                                //cursorWidth: 2,
                                decoration: InputDecoration(
                                  labelText: "Answer",
                                  hintText: 'Enter your answer',
                                  labelStyle: const TextStyle(
                                      fontFamily: "Times New Roman",
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      )),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                controller: controller.inputController,
                                onSaved: (value) {
                                  controller.selectedAnswer.value = value!;
                                },
                                // validator: (value) {
                                //   return controller.validateEmail(value!);
                                // },
                              ),
                            ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // (controller.index.value == 0)
                    //     ? const SizedBox.shrink()
                    //     : GestureDetector(
                    //         onTap: () => controller.dicressIndex(),
                    //         child: Container(
                    //           margin: const EdgeInsets.all(20),
                    //           decoration: BoxDecoration(
                    //               color: const Color(0xFFff8000),
                    //               border: Border.all(
                    //                 color: const Color(0xFFff8000),
                    //               ),
                    //               borderRadius:
                    //                   const BorderRadius.all(Radius.circular(14))),
                    //           padding: const EdgeInsets.all(14),
                    //           child: const Text(
                    //             'Previous',
                    //             style: TextStyle(
                    //                 fontSize: 20,
                    //                 color: Colors.white,
                    //                 fontFamily: "Times New Roman",
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    GestureDetector(
                      onTap: () {
                        _value = 0;
                        if ((controller.questionListData[controller.index.value]
                                    .type
                                    .toString() ==
                                "MCQ") ||
                            (controller.questionListData[controller.index.value]
                                    .type
                                    .toString() ==
                                "Fill In The Blanks")) {
                          controller.hitQuestionResponseApi(
                              controller
                                  .questionListData[controller.index.value].id
                                  .toString(),
                              controller.selectedAnswer.value,
                              controller
                                  .questionListData[controller.index.value]
                                  .answer
                                  .toString(),
                              controller
                                  .questionListData[controller.index.value]
                                  .marks
                                  .toString());
                        } else {
                          var s = controller.inputController.text;
                          controller.hitQuestionResponseApi(
                              controller
                                  .questionListData[controller.index.value].id
                                  .toString(),
                              s,
                              controller
                                  .questionListData[controller.index.value]
                                  .answer
                                  .toString(),
                              controller
                                  .questionListData[controller.index.value]
                                  .marks
                                  .toString());
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0xFFff8000),
                            border: Border.all(
                              color: const Color(0xFFff8000),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14))),
                        padding: const EdgeInsets.all(14),
                        child:
                            (controller.count.value == controller.length.value)
                                ? Text(
                                    'Finish',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "Times New Roman",
                                        fontWeight: FontWeight.bold),
                                  )
                                : Column(
                                    children: const [
                                      Text(
                                        'Save &',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: "Times New Roman",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Next',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: "Times New Roman",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

//########################################################################################
                          //write the answer in subjective.................

                          


//###########################################################################################
                          // objective type ................

                          //     Radio(
                          //         activeColor: Colors.black,
                          //         value: 1,
                          //         groupValue: _value,
                          //         onChanged: (value) {
                          //           setState(() {
                          //             _value = value!;
                          //           });
                          //         }),
                          //     const SizedBox(width: 8),
                          //     Row(
                          //       children: const [
                          //         Image(
                          //           image: NetworkImage(
                          //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRREj9CqbIB2SKp8pMX1jjUigv_wlaUbx3OwA&usqp=CAU"),
                          //           height: 80,
                          //           width: 100,
                          //         ),
                          //         SizedBox(
                          //           width: 18,
                          //         ),
                          //         Text(
                          //           'That is a Image ',
                          //           style: TextStyle(
                          //               fontSize: 14,
                          //               color: Colors.black,
                          //               fontFamily: "Times New Roman",
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ],
                          //     )
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Radio(
                          //         activeColor: Colors.black,
                          //         value: 2,
                          //         groupValue: _value,
                          //         onChanged: (value) {
                          //           setState(() {
                          //             _value = value!;
                          //           });
                          //         }),
                          //     const SizedBox(width: 8),
                          //     const Image(
                          //       image: NetworkImage(
                          //           "https://physics.biu.ac.il/sites/physics/files/styles/front_hero_slide_/public/imgs/slides21/shutterstock_2146705679.jpg?itok=ouregCv2"),
                          //       height: 80,
                          //       width: 100,
                          //     )
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Radio(
                          //         activeColor: Colors.black,
                          //         value: 3,
                          //         groupValue: _value,
                          //         onChanged: (value) {
                          //           setState(() {
                          //             _value = value!;
                          //           });
                          //         }),
                          //     const SizedBox(width: 8),
                          //     const Image(
                          //       image: NetworkImage(
                          //           "https://4satprep.com/wp-content/uploads/2020/06/formula-594149_1920.jpg"),
                          //       height: 80,
                          //       width: 100,
                          //     )
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Radio(
                          //         activeColor: Colors.black,
                          //         value: 4,
                          //         groupValue: _value,
                          //         onChanged: (value) {
                          //           setState(() {
                          //             _value = value!;
                          //           });
                          //         }),
                          //     const SizedBox(width: 8),
                          //     const Image(
                          //       image: NetworkImage(
                          //           "https://doubtnut-static.s.llnwi.net/static/web-thumb/644258456_web.png"),
                          //       height: 80,
                          //       width: 100,
                          //     )

//##########################################################################################