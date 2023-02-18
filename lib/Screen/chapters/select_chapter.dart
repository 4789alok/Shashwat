import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/chapters/controller/chapter_controller.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/tests/test_instruction.dart';
import 'package:shashwat/Screen/tests/test_list.dart';
import 'package:shashwat/Screen/class_list/class_list.dart';
import 'package:shashwat/Widget/banner.dart';

class SelectChapter extends StatefulWidget {
  const SelectChapter({super.key});

  @override
  State<SelectChapter> createState() => _SelectChapterState();
}

class _SelectChapterState extends State<SelectChapter> {
  // int _value = 0;
  // final List<String> chapter = [
  //   'Chapter 1',
  //   'Chapter 2',
  //   'Chapter 3',
  //   'Chapter 4',
  //   'Chapter 5',
  //   'Chapter 6',
  // ];
  // String? selectchapter;
  final controller = Get.find<SelectChapterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF033d73),
        title: const Text(
          'Select Chapter',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
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
          Obx(() {
            return controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // const Padding(
                          //   padding: EdgeInsets.all(8.0),
                          //   child: Text(
                          //     "Master teachers",
                          //     style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.black),
                          //   ),
                          // ),
                          Column(
                            children: [
                              // Container(
                              //   margin: const EdgeInsets.all(12),
                              //   height: 300,
                              //   child: ListView.builder(
                              //     scrollDirection: Axis.horizontal,
                              //     itemBuilder: (context, index) {
                              //       return Stack(children: [
                              //         Container(
                              //           child: Stack(children: [
                              //             Container(
                              //               // padding: EdgeInsets.all(12),
                              //               decoration: BoxDecoration(
                              //                   border: Border.all(
                              //                     color: Colors.grey.shade300,
                              //                     width: 2,
                              //                   ),
                              //                   shape: BoxShape.rectangle,
                              //                   borderRadius:
                              //                       const BorderRadius.all(
                              //                           Radius.circular(20)),
                              //                   image: DecorationImage(
                              //                       image: NetworkImage(
                              //                         cource[index]["masters"],
                              //                       ),
                              //                       fit: BoxFit.cover)),
                              //               width: MediaQuery.of(context)
                              //                       .size
                              //                       .width -
                              //                   200,
                              //               margin: const EdgeInsets.symmetric(
                              //                   horizontal: 8.0),
                              //             ),
                              //             Positioned(
                              //                 bottom: 10,
                              //                 right: 10,
                              //                 left: 10,
                              //                 child: Container(
                              //                   padding: EdgeInsets.all(14),
                              //                   margin: EdgeInsets.only(
                              //                       left: 6, right: 5),
                              //                   // height: 100,
                              //                   //width: 150,
                              //                   decoration: BoxDecoration(
                              //                       color: Colors.grey.shade700,
                              //                       borderRadius:
                              //                           BorderRadius.all(
                              //                               Radius.circular(10))),
                              //                   child: Column(
                              //                     children: const [
                              //                       Text(
                              //                         "sangeetha",
                              //                         style: TextStyle(
                              //                             fontSize: 14,
                              //                             fontWeight:
                              //                                 FontWeight.bold,
                              //                             color: Colors.white),
                              //                       ),
                              //                       SizedBox(
                              //                         height: 2,
                              //                       ),
                              //                       Text(
                              //                         "Boards",
                              //                         style: TextStyle(
                              //                             fontSize: 14,
                              //                             fontWeight:
                              //                                 FontWeight.bold,
                              //                             color: Colors.white),
                              //                       ),
                              //                       SizedBox(
                              //                         height: 2,
                              //                       ),
                              //                       Text(
                              //                         "MSc.,Cochin Uni..",
                              //                         style: TextStyle(
                              //                             fontSize: 14,
                              //                             fontWeight:
                              //                                 FontWeight.bold,
                              //                             color: Colors.white),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ))
                              //           ]),
                              //         ),
                              //         Positioned(
                              //             //  top: 10,
                              //             left: 65,
                              //             bottom: 78,
                              //             child: Container(
                              //               padding: EdgeInsets.all(2),
                              //               decoration: BoxDecoration(
                              //                   color: Colors.amber.shade500,
                              //                   borderRadius: BorderRadius.all(
                              //                       Radius.circular(10))),
                              //               child: const Text(
                              //                 "4+ year exp",
                              //                 style: TextStyle(
                              //                     fontSize: 14,
                              //                     fontWeight: FontWeight.bold,
                              //                     color: Colors.black),
                              //               ),
                              //             ))
                              //       ]);
                              //     },
                              //     itemCount: cource.length,
                              //   ),
                              // ),
                              bannerSlider(controller.bannerListData, context),
                              const SizedBox(
                                height: 40,
                              ),
                              controller.chapterListData.isEmpty
                                  ? Container(
                                      height: 300,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const CustomText(
                                              text: 'No Data Listed'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                controller.hitChapterApi(),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.refresh,
                                                  color: Color(0xFF033d73),
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                CustomText(
                                                  text: 'Refresh',
                                                  color: Color(0xFF033d73),
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          controller.chapterListData.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            const SizedBox(width: 8),
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed('/testList',
                                                    arguments: [
                                                      {
                                                        'mediumID':
                                                            controller.mediumID,
                                                        'standerID': controller
                                                            .standerID,
                                                        'subjectID': controller
                                                            .subjectID,
                                                        'chapterID': controller
                                                            .chapterListData[
                                                                index]
                                                            .id
                                                            .toString(),
                                                      }
                                                    ]);
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.all(8),
                                                // height: 42,
                                                width: 130,
                                                padding: const EdgeInsets.only(
                                                    top: 8, bottom: 10),
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFF033d73),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    controller
                                                        .chapterListData[index]
                                                        .name
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          "Times New Roman",
                                                    ),
                                                    //   ),
                                                    // ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },),
                            ],
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

final List<Map<String, dynamic>> cource = [
  {
    "masters":
        "https://thumbs.dreamstime.com/b/portrait-young-male-teacher-background-school-blackboard-teacher-s-day-knowledge-day-back-to-school-study-159722312.jpg",
  },
  {
    "masters":
        "https://static9.depositphotos.com/1070812/1091/i/600/depositphotos_10916856-stock-photo-teacher-on-background-of-blackboard.jpg",
  },
  {
    "masters": "https://img.krishijagran.com/media/77330/teachers.png",
  },
];
final List<Map<String, dynamic>> chapterr = [
  {
    "chaptername": "chapter 1",
  },
  {
    "chaptername": "chapter 2",
  },
  {
    "chaptername": "chapter 3",
  },
  {
    "chaptername": "chapter 4",
  },
  {
    "chaptername": "chapter 5",
  },
];
