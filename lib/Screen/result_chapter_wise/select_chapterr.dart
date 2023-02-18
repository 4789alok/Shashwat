import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/result_chapter_wise/controller/result_chapter_wise_controller.dart';
import 'package:shashwat/Widget/banner.dart';

class ResultChapterWise extends StatefulWidget {
  const ResultChapterWise({super.key});

  @override
  State<ResultChapterWise> createState() => _ResultChapterWiseState();
}

class _ResultChapterWiseState extends State<ResultChapterWise> {
  final controller = Get.find<ResultChapterWiseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        controller.chapterListData.isEmpty
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
                                      onTap: () => controller.hitChapterApi(),
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
                                itemCount: controller.chapterListData.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/resultTestWise',
                                            arguments: [
                                              {
                                                'subjectID':
                                                    controller.subjectID,
                                                'chapterID': controller
                                                    .chapterListData[index].id
                                                    .toString()
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
                                            color: const Color(0xFF033d73),
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
                                                    .chapterListData[index].name
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),),
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
