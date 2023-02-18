import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/standerd/controller/select_standerd_controller.dart';
import 'package:shashwat/Widget/banner.dart';

class SelectStandard extends StatelessWidget {
  const SelectStandard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SelectStanderdController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor:const Color(0xFF033d73),
        title: const Text(
          'Select Standard',
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
          Obx(
            () {
              return controller.isLoading.isTrue
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          bannerSlider(controller.bannerListData, context),
                          controller.standerdListData.isEmpty
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
                                        onTap: () =>
                                            controller.hitStanderdApi(),
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
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GridView.builder(
                                    // padding: EdgeInsets.all(40),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 30,
                                      mainAxisSpacing: 10,

                                      childAspectRatio: 4 /
                                          1, // #Size Rasio ke liye use hota h
                                    ),
                                    itemCount:
                                        controller.standerdListData.length,
                                    itemBuilder: (context, index) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed('/subject',
                                                    arguments: [
                                                      {
                                                        'mediumID':
                                                            controller.mediumID,
                                                        'standerID': controller
                                                            .standerdListData[
                                                                index]
                                                            .id
                                                            .toString(),
                                                      }
                                                    ]);
                                              },
                                              child: Container(
                                                //  height: 39,
                                                //width: 120,

                                                padding: const EdgeInsets.all(9),
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFF033d73),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    controller
                                                        .standerdListData[index]
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
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // ignore: avoid_unnecessary_containers
                                          ],
                                        ),
                                      );
                                    },
                                    //itemCount: 6,
                                  ),
                                ),
                        ],
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
