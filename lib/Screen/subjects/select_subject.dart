import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/chapters/select_chapter.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/medium/select_medium.dart';
import 'package:shashwat/Screen/subjects/controller/select_subject_controller.dart';
import 'package:shashwat/Screen/subjects/select_subject.dart';
import 'package:shashwat/Widget/banner.dart';

class SelectSubject extends StatefulWidget {
  const SelectSubject({super.key});

  @override
  State<SelectSubject> createState() => _SelectSubjectState();
}

class _SelectSubjectState extends State<SelectSubject> {
  final controller = Get.find<SubjectController>();
  // final List<String> itemsss = [
  //   'Physics',
  //   'Maths',
  //   'English',
  //   'Chemistry',
  //   'Hindi'
  // ];

  // String? selectedValue3;

  // int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF033d73),
        title: const Text(
          'Select Subject',
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
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        bannerSlider(controller.bannerListData, context),
                        const SizedBox(
                          height: 40,
                        ),
                        // Row(
                        //   children: [
                        // Radio(
                        //     activeColor: Color(0xFF033d73),
                        //     value: 1,
                        //     groupValue: _value,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         _value = 1;
                        //       });
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   const SelectChapter()));
                        //     }),
                        // const SizedBox(width: 8),

                        //   ],
                        // ),

                        controller.subjectListData.isEmpty
                            ? Container(
                                height: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CustomText(text: 'No Data Listed'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () => controller.hitSubjectdApi(),
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
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.subjectListData.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      const SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed('/chapter', arguments: [
                                            {
                                              'mediumID': controller.mediumID,
                                              'standerID': controller.standerID,
                                              'subjectID': controller
                                                  .subjectListData[index].id
                                                  .toString(),
                                            }
                                          ]);
                                        },
                                        child: Container(
                                          //  height: 42,
                                          width: 130,
                                          margin: EdgeInsets.all(8),
                                          padding: EdgeInsets.only(
                                              top: 9, bottom: 9),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF033d73),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              controller
                                                  .subjectListData[index].name
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Times New Roman",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                      ],
                    ),
                  );
          }),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> subjectt = [
  {
    "subjectname": "Maths",
  },
  {
    "subjectname": "English",
  },
  {
    "subjectname": "Gujarati",
  },
  {
    "subjectname": "Science",
  },
];
