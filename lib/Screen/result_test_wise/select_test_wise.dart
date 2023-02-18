import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/result_test_wise/controller/result_test_wise_controller.dart';
import 'package:shashwat/Screen/tests/test_instruction.dart';
import 'package:shashwat/Screen/Result/tab_bar.dart';
import 'package:shashwat/Screen/auth/welcome_page.dart';
import 'package:shashwat/Widget/banner.dart';

class ResultTestWise extends StatefulWidget {
  const ResultTestWise({super.key});

  @override
  State<ResultTestWise> createState() => _ResultTestWiseState();
}

class _ResultTestWiseState extends State<ResultTestWise> {
  final controller = Get.find<ResultTestWiseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF033d73),
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
                        controller.testListData.isEmpty
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
                                      onTap: () => controller.hitTestApi(),
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
                                padding: const EdgeInsets.only(top: 20),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.testListData.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        ((controller.testListData[index].date
                                                        .toString() ==
                                                    "null") ||
                                                (controller.testListData[index]
                                                        .time
                                                        .toString() ==
                                                    "null"))
                                            ? Get.toNamed('/resultDateWise',
                                                arguments: [
                                                    {
                                                      'subjectID':
                                                          controller.subjectID,
                                                      'chapterID': controller
                                                          .chapterID
                                                          .toString(),
                                                      'testID': controller
                                                          .testListData[index]
                                                          .id
                                                          .toString(),
                                                      'testName': controller
                                                          .testListData[index]
                                                          .name
                                                          .toString()
                                                    }
                                                  ])
                                            : Get.toNamed('/result',
                                                arguments: [
                                                    {
                                                      'subjectID':
                                                          controller.subjectID,
                                                      'chapterID': controller
                                                          .chapterID
                                                          .toString(),
                                                      'testID': controller
                                                          .testListData[index]
                                                          .id
                                                          .toString(),
                                                      'testName': controller
                                                          .testListData[index]
                                                          .name
                                                          .toString(),
                                                      'date': controller
                                                          .testListData[index]
                                                          .date
                                                          .toString(),
                                                      'time': controller
                                                          .testListData[index]
                                                          .time
                                                          .toString(),
                                                    }
                                                  ]);
                                      },
                                      child: Container(
                                          width: 140,
                                          margin: const EdgeInsets.only(
                                            bottom: 10,
                                            top: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF033d73),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey.shade400),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(6)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Center(
                                              child: Text(
                                                controller
                                                    .testListData[index].name
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  );
                                }),
                      ],
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
