import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/medium/controller/select_medium_controller.dart';
import 'package:shashwat/Widget/banner.dart';

class Medium extends GetView<MediumController> {
  Medium({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.hitMediumApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF033d73),
        title: const Text(
          'Select Medium',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.bold),
        ),
        // title: const Text(
        //   "To take such a test the candidate needs",
        //   style: TextStyle(
        //       fontSize: 18,
        //       // Color(0xFF033d73),backgroundColor: Color(0xFF033d73),
        //       fontFamily: "Times New Roman",
        //       fontWeight: FontWeight.bold),
        // ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              //  height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("./images/backin.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            // width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Obx(() {
                return controller.isLoading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Our Toppers",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          bannerSlider(controller.bannerListData, context),
                          const SizedBox(
                            height: 40,
                          ),
                          controller.mediumListData.isEmpty
                              ? Container(
                                  height: 300,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(text: 'No Data Listed'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () => controller.hitMediumApi(),
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
                              : SizedBox(
                                  width: 180,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed('/standerd', arguments: [
                                            {
                                              'id': controller
                                                  .mediumListData[index].id
                                                  .toString()
                                            }
                                          ]);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.all(10),

                                          //   height: 42,
                                          width: 20,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF033d73),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            controller
                                                .mediumListData[index].name
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                // color: Color(0xFFff8000),
                                                fontFamily: "Times New Roman",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: controller.mediumListData.length,
                                  ),
                                ),
                        ],
                      );
              }),
            ),
          ),
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
