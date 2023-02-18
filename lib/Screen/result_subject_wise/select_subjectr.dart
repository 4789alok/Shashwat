import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/result_subject_wise/controller/select_result_subject_wise_controller.dart';
import 'package:shashwat/Widget/banner.dart';

class ResultSubjectWise extends GetView<ResultSubjectWiseController> {
  ResultSubjectWise({super.key}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.hitSubjectdApi();
      controller.hitBannerApi();
      print('object');
    });
  }

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
                        controller.subjectListData.isEmpty
                            ? Container(
                                height: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(text: 'No Result Listed'),
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
                                padding: const EdgeInsets.only(top: 20),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.subjectListData.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/resultchapterWise',
                                            arguments: [
                                              {
                                                'subjectID': controller
                                                    .subjectListData[index].id
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
                                            color:const Color(0xFF033d73),
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
                                                    .subjectListData[index].name
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

final List<Map<String, dynamic>> toppers = [
  {
    "banner":
        "https://images.prismic.io/brightworld/f874fb3e-ef71-425e-90bb-6c6650a73248_In-Class-opt.jpg?auto=compress,format&rect=0,0,3500,2333&w=1440&h=960",
  },
  {
    "banner":
        "https://static.toiimg.com/thumb/msid-64071779,width-400,resizemode-4/64071779.jpg",
  },
  {
    "banner":
        "https://ummid.com/news/2021/september/15.09.2021/jee-main-toppers-interview.jpg",
  },
];
