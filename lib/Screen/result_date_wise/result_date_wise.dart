import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/result_date_wise/controller/result_date_wise_controller.dart';
import 'package:shashwat/Widget/banner.dart';

class ResultDateWise extends StatefulWidget {
  const ResultDateWise({super.key});

  @override
  State<ResultDateWise> createState() => _ResultDateWiseState();
}

class _ResultDateWiseState extends State<ResultDateWise> {
  final controller = Get.find<ResultDateWiseController>();
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
                        controller.timeListData.isEmpty
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
                                itemCount: controller.timeListData.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/result', arguments: [
                                          {
                                            'subjectID': controller.subjectID,
                                            'chapterID':
                                                controller.chapterID.toString(),
                                            'testID':
                                                controller.testID.toString(),
                                            'testName':
                                                controller.testName.toString(),
                                            'date': controller
                                                .timeListData[index].date
                                                .toString(),
                                            'time': controller
                                                .timeListData[index].time
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
                                                '${controller.timeListData[index].date} ${getTime12HrFormate(controller.timeListData[index].time.toString())}'
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

  getTime12HrFormate(String time) {
    DateTime tempDate = DateFormat("hh:mm").parse(time);
    return DateFormat("hh:mm a").format(tempDate);
  }
}
