import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/home/controller/home_controller.dart';
import 'package:shashwat/Widget/banner.dart';
import 'package:shashwat/constant/constants.dart';

class Home extends GetView<HomeController> {
  Home({super.key}) {
    controller.hitBannerApi();
    controller.hitNoticeApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF033d73),
                ),
                //arrowColor: Color(0xFF033d73),

                accountName: Text(
                  box.read('name').toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  box.read('email').toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold),
                ),
                currentAccountPicture: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    // image: DecorationImage(
                    //     image: AssetImage("images/shashwat1.png"),
                    //     fit: BoxFit.fill)
                  ),
                  child: const Image(
                    image: AssetImage("images/shashwat1.png"),
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed('/profile');
                },
                leading: const Icon(
                  Icons.person,
                  size: 36,
                  color: Color(0xFF033d73),
                ),
                title: const Text(
                  "My Profile",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(thickness: 1),
              ListTile(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Get.toNamed('/medium');
                  });
                },
                leading: const Icon(
                  Icons.text_snippet_sharp,
                  size: 36,
                  color: Color(0xFF033d73),
                ),
                title: const Text(
                  "Test/Exam",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(thickness: 1),
              ListTile(
                onTap: () {
                  Get.toNamed('/resultSubjectWise');
                },
                leading: const Icon(
                  Icons.outbox_sharp,
                  size: 36,
                  color: Color(0xFF033d73),
                ),
                title: const Text(
                  "Result",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(thickness: 1),
              ListTile(
                onTap: () {
                  box.write('isLogedIn', false);
                  box.remove('id');
                  box.remove('name');
                  box.remove('email');
                  Get.offAllNamed('/signIn');
                },
                leading: Icon(
                  Icons.logout,
                  size: 36,
                  color: Color(0xFF033d73),
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(thickness: 1),
              ListTile(
                onTap: () {
                  Get.toNamed('/privacy');
                },
                title: const Text(
                  "Privacy Policy",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(thickness: 1),
            ],
          ),
        ),
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
              return (controller.isLoading2.isTrue ||
                      controller.checkData.value == "")
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        controller.bannerListData.isEmpty
                            ? const SizedBox.shrink()
                            : bannerSlider(controller.bannerListData, context),
                        const SizedBox(height: 24),
                        (controller.checkData.value == '')
                            ? const SizedBox.shrink()
                            : Container(
                                decoration: const BoxDecoration(
                                  color: const Color(0xFFff8000),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                padding: const EdgeInsets.all(14.0),
                                child: const Text(
                                  "New Updates",
                                  style: TextStyle(
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                        (controller.checkData.value == '')
                            ? const SizedBox.shrink()
                            : controller.noticeListData.isEmpty
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
                                              controller.hitNoticeApi(),
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
                                    padding: const EdgeInsets.only(top: 16),
                                    itemCount: controller.noticeListData.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(left: 54),
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                            "${controller.noticeListData[index].notes}",
                                            style: const TextStyle(
                                                color: Color(0xFF033d73),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Times New Roman",
                                                fontSize: 16)),
                                      );
                                    })
                      ],
                    );
            }),
          ],
        )
        // bottomNavigationBar: const Bottom_Navigate(),
        );
  }
}

final List<Map<String, dynamic>> toppers = [
  {
    "banner":
        "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2019/05/06/Pictures/_620b5482-6f6b-11e9-adf4-e14f82ec3649.jpg",
  },
  {
    "banner":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG5nrRE2RBSWF2SquLyCC1DKMFYSeP17ehvQ&usqp=CAU",
  },
  {
    "banner":
        "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2020/07/girl-1594910935.jpg",
  },
];
