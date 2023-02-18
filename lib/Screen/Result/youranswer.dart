import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/Result/controller/result_controller.dart';
import 'package:shashwat/Services/http_service_impl.dart';

class YourAnswer extends StatefulWidget {
  const YourAnswer({super.key});

  @override
  State<YourAnswer> createState() => _YourAnswerState();
}

class _YourAnswerState extends State<YourAnswer> {
  int _value = 1;
  final controller = Get.find<ResultController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(bottom: 0),
                itemCount: controller.answerListData.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Question ${index + 1}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Html(
                                data:
                                    """${controller.answerListData[index].question.toString()}""",
                                //wordSpacing: 4,
                                style: {
                                  "body": Style(
                                      fontSize: const FontSize(18.0),
                                      color: Colors.black,
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold),
                                }),
                            ((controller.answerListData[index].question_image
                                            .toString() ==
                                        '') ||
                                    (controller.answerListData[index]
                                            .question_image
                                            .toString() ==
                                        'null'))
                                ? const SizedBox.shrink()
                                : Image(
                                    image: NetworkImage(
                                      BASE_URL +
                                          controller.answerListData[index]
                                              .question_image
                                              .toString(),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                            // Text(
                            //   controller.answerListData[index].question
                            //       .toString(),
                            //   style: const TextStyle(
                            //       //wordSpacing: 4,
                            //       fontSize: 14,
                            //       color: Color(0xFF033d73),
                            //       fontFamily: "Times New Roman",
                            //       fontWeight: FontWeight.bold),
                            // ),
                            const SizedBox(height: 30),
                            (controller.answerListData[index].type.toString() ==
                                    'Text')
                                ? Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 8.0),
                                        color: (controller.answerListData[index]
                                                    .answer
                                                    .toString() ==
                                                controller.answerListData[index]
                                                    .user_answer
                                                    .toString())
                                            ? Colors.green
                                            : Colors.transparent,
                                        child: Row(
                                          children: [
                                            controller.answerListData[index]
                                                        .user_answer
                                                        .toString() ==
                                                    'null'
                                                ? const SizedBox.shrink()
                                                : Text(
                                                    controller
                                                        .answerListData[index]
                                                        .user_answer
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF033d73),
                                                        fontFamily:
                                                            "Times New Roman",
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Correct Answer:',
                                            style: TextStyle(
                                                fontSize: 12,
                                                // color: Color(0xFF033d73),
                                                fontFamily: "Times New Roman",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            controller
                                                .answerListData[index].answer
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF033d73),
                                                fontFamily: "Times New Roman",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      (((controller.answerListData[index]
                                                          .option_image1
                                                          .toString() ==
                                                      'null') ||
                                                  (controller
                                                          .answerListData[index]
                                                          .option_image1
                                                          .toString() ==
                                                      '')) &&
                                              ((controller.answerListData[index]
                                                          .option1
                                                          .toString() ==
                                                      'null') ||
                                                  (controller
                                                          .answerListData[index]
                                                          .option1
                                                          .toString() ==
                                                      '')))
                                          ? const SizedBox.shrink()
                                          : Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 8.0),
                                              color: ((controller
                                                              .answerListData[
                                                                  index]
                                                              .answer
                                                              .toString() ==
                                                          'a') &&
                                                      (controller
                                                              .answerListData[
                                                                  index]
                                                              .user_answer
                                                              .toString() ==
                                                          'a'))
                                                  ? Colors.green
                                                  : ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .user_answer
                                                                  .toString() ==
                                                              'a') &&
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .answer
                                                                  .toString() !=
                                                              'a'))
                                                      ? Colors.red
                                                      : ((controller
                                                                      .answerListData[
                                                                          index]
                                                                      .user_answer
                                                                      .toString() !=
                                                                  'a') &&
                                                              (controller
                                                                      .answerListData[
                                                                          index]
                                                                      .answer
                                                                      .toString() ==
                                                                  'a'))
                                                          ? Colors.green
                                                          : Colors.transparent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: Icon(
                                                      (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .user_answer
                                                                  .toString() ==
                                                              'a')
                                                          ? Icons.check_circle
                                                          : Icons
                                                              .circle_outlined,
                                                      color: Color(0xFF033d73),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option1
                                                                  .toString() ==
                                                              'null') ||
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option1
                                                                  .toString() ==
                                                              ''))
                                                      ? const SizedBox.shrink()
                                                      : Expanded(
                                                          child: Html(
                                                              data:
                                                                  """${controller.answerListData[index].option1.toString()}""",
                                                              style: {
                                                                "body": Style(
                                                                    fontSize:
                                                                        const FontSize(
                                                                            12.0),
                                                                    color: Color(
                                                                        0xFF033d73),
                                                                    fontFamily:
                                                                        "Times New Roman",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              }),
                                                        ),
                                                  ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option_image1
                                                                  .toString() ==
                                                              '') ||
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option_image1
                                                                  .toString() ==
                                                              'null'))
                                                      ? const SizedBox.shrink()
                                                      : Image(
                                                          image: NetworkImage(
                                                            BASE_URL +
                                                                controller
                                                                    .answerListData[
                                                                        index]
                                                                    .option_image1
                                                                    .toString(),
                                                          ),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                        )
                                                ],
                                              ),
                                            ),
                                      (((controller.answerListData[index]
                                                          .option_image2
                                                          .toString() ==
                                                      'null') ||
                                                  (controller
                                                          .answerListData[index]
                                                          .option_image2
                                                          .toString() ==
                                                      '')) &&
                                              ((controller.answerListData[index]
                                                          .option2
                                                          .toString() ==
                                                      'null') ||
                                                  (controller
                                                          .answerListData[index]
                                                          .option2
                                                          .toString() ==
                                                      '')))
                                          ? const SizedBox.shrink()
                                          : Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 8.0),
                                              color: ((controller
                                                              .answerListData[
                                                                  index]
                                                              .answer
                                                              .toString() ==
                                                          'b') &&
                                                      (controller
                                                              .answerListData[
                                                                  index]
                                                              .user_answer
                                                              .toString() ==
                                                          'b'))
                                                  ? Colors.green
                                                  : ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .user_answer
                                                                  .toString() ==
                                                              'b') &&
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .answer
                                                                  .toString() !=
                                                              'b'))
                                                      ? Colors.red
                                                      : ((controller
                                                                      .answerListData[
                                                                          index]
                                                                      .user_answer
                                                                      .toString() !=
                                                                  'b') &&
                                                              (controller
                                                                      .answerListData[
                                                                          index]
                                                                      .answer
                                                                      .toString() ==
                                                                  'b'))
                                                          ? Colors.green
                                                          : Colors.transparent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: Icon(
                                                      (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .user_answer
                                                                  .toString() ==
                                                              'b')
                                                          ? Icons.check_circle
                                                          : Icons
                                                              .circle_outlined,
                                                      color: Color(0xFF033d73),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option2
                                                                  .toString() ==
                                                              'null') ||
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option2
                                                                  .toString() ==
                                                              ''))
                                                      ? const SizedBox.shrink()
                                                      : Expanded(
                                                          child: Html(
                                                              data:
                                                                  """${controller.answerListData[index].option2.toString()}""",
                                                              style: {
                                                                "body": Style(
                                                                    fontSize:
                                                                        const FontSize(
                                                                            12.0),
                                                                    color: Color(
                                                                        0xFF033d73),
                                                                    fontFamily:
                                                                        "Times New Roman",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              }),
                                                        ),
                                                  ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option_image2
                                                                  .toString() ==
                                                              '') ||
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option_image2
                                                                  .toString() ==
                                                              'null'))
                                                      ? const SizedBox.shrink()
                                                      : Image(
                                                          image: NetworkImage(
                                                            BASE_URL +
                                                                controller
                                                                    .answerListData[
                                                                        index]
                                                                    .option_image2
                                                                    .toString(),
                                                          ),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                        )
                                                ],
                                              ),
                                            ),
                                      (((controller.answerListData[index]
                                                          .option_image3
                                                          .toString() ==
                                                      'null') ||
                                                  (controller
                                                          .answerListData[index]
                                                          .option_image3
                                                          .toString() ==
                                                      '')) &&
                                              ((controller.answerListData[index]
                                                          .option3
                                                          .toString() ==
                                                      'null') ||
                                                  (controller
                                                          .answerListData[index]
                                                          .option3
                                                          .toString() ==
                                                      '')))
                                          ? const SizedBox.shrink()
                                          : Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 8.0),
                                              color: ((controller
                                                              .answerListData[
                                                                  index]
                                                              .answer
                                                              .toString() ==
                                                          'c') &&
                                                      (controller
                                                              .answerListData[
                                                                  index]
                                                              .user_answer
                                                              .toString() ==
                                                          'c'))
                                                  ? Colors.green
                                                  : ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .user_answer
                                                                  .toString() ==
                                                              'c') &&
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .answer
                                                                  .toString() !=
                                                              'c'))
                                                      ? Colors.red
                                                      : ((controller
                                                                      .answerListData[
                                                                          index]
                                                                      .user_answer
                                                                      .toString() !=
                                                                  'c') &&
                                                              (controller
                                                                      .answerListData[
                                                                          index]
                                                                      .answer
                                                                      .toString() ==
                                                                  "c"))
                                                          ? Colors.green
                                                          : Colors.transparent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: Icon(
                                                      (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .user_answer
                                                                  .toString() ==
                                                              'c')
                                                          ? Icons.check_circle
                                                          : Icons
                                                              .circle_outlined,
                                                      color: Color(0xFF033d73),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option3
                                                                  .toString() ==
                                                              'null') ||
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option3
                                                                  .toString() ==
                                                              ''))
                                                      ? const SizedBox.shrink()
                                                      : Expanded(
                                                          child: Html(
                                                              data:
                                                                  """${controller.answerListData[index].option3.toString()}""",
                                                              style: {
                                                                "body": Style(
                                                                    fontSize:
                                                                        const FontSize(
                                                                            12.0),
                                                                    color: Color(
                                                                        0xFF033d73),
                                                                    fontFamily:
                                                                        "Times New Roman",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              }),
                                                        ),
                                                  ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option_image3
                                                                  .toString() ==
                                                              '') ||
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option_image3
                                                                  .toString() ==
                                                              'null'))
                                                      ? const SizedBox.shrink()
                                                      : Image(
                                                          image: NetworkImage(
                                                            BASE_URL +
                                                                controller
                                                                    .answerListData[
                                                                        index]
                                                                    .option_image3
                                                                    .toString(),
                                                          ),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                        ),
                                                ],
                                              ),
                                            ),
                                      (((controller.answerListData[index]
                                                          .option_image4
                                                          .toString() ==
                                                      'null') ||
                                                  (controller
                                                          .answerListData[index]
                                                          .option_image4
                                                          .toString() ==
                                                      '')) &&
                                              ((controller.answerListData[index]
                                                          .option4
                                                          .toString() ==
                                                      'null') ||
                                                  (controller
                                                          .answerListData[index]
                                                          .option4
                                                          .toString() ==
                                                      '')))
                                          ? const SizedBox.shrink()
                                          : Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 8.0),
                                              color: ((controller
                                                              .answerListData[
                                                                  index]
                                                              .answer
                                                              .toString() ==
                                                          'd') &&
                                                      (controller
                                                              .answerListData[
                                                                  index]
                                                              .user_answer
                                                              .toString() ==
                                                          'd'))
                                                  ? Colors.green
                                                  : ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .user_answer
                                                                  .toString() ==
                                                              'd') &&
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .answer
                                                                  .toString() !=
                                                              'd'))
                                                      ? Colors.red
                                                      : ((controller
                                                                      .answerListData[
                                                                          index]
                                                                      .user_answer
                                                                      .toString() !=
                                                                  'd') &&
                                                              (controller
                                                                      .answerListData[
                                                                          index]
                                                                      .answer
                                                                      .toString() ==
                                                                  'd'))
                                                          ? Colors.green
                                                          : Colors.transparent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0),
                                                    child: Icon(
                                                      (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .user_answer
                                                                  .toString() ==
                                                              'd')
                                                          ? Icons.check_circle
                                                          : Icons
                                                              .circle_outlined,
                                                      color: Color(0xFF033d73),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option4
                                                                  .toString() ==
                                                              'null') ||
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option4
                                                                  .toString() ==
                                                              ''))
                                                      ? const SizedBox.shrink()
                                                      : Expanded(
                                                          child: Html(
                                                              data:
                                                                  """${controller.answerListData[index].option4.toString()}""",
                                                              style: {
                                                                "body": Style(
                                                                    fontSize:
                                                                        const FontSize(
                                                                            12.0),
                                                                    color: const Color(
                                                                        0xFF033d73),
                                                                    fontFamily:
                                                                        "Times New Roman",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              }),
                                                        ),
                                                  ((controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option_image4
                                                                  .toString() ==
                                                              '') ||
                                                          (controller
                                                                  .answerListData[
                                                                      index]
                                                                  .option_image4
                                                                  .toString() ==
                                                              'null'))
                                                      ? const SizedBox.shrink()
                                                      : Image(
                                                          image: NetworkImage(
                                                            BASE_URL +
                                                                controller
                                                                    .answerListData[
                                                                        index]
                                                                    .option_image4
                                                                    .toString(),
                                                          ),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                        ),
                                                ],
                                              ),
                                            ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                      )
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   // height: 100,
                      //   padding: EdgeInsets.all(10),
                      //   width: double.infinity,
                      //   color: Colors.grey.shade200,
                      //   child: Row(
                      //     children: [
                      //       const Text(
                      //         'YOUR ANSWER IS : ',
                      //         style: TextStyle(
                      //             fontSize: 12,
                      //             color: Color(0xFF033d73),
                      //             fontFamily: "Times New Roman",
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //       Text(
                      //         controller.answerListData[index].user_answer
                      //             .toString(),
                      //         style: const TextStyle(
                      //             fontSize: 14,
                      //             color: Colors.red,
                      //             fontFamily: "Times New Roman",
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  );
                });
      }),
    );
  }
}
