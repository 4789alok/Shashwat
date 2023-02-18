import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shashwat/Screen/class_list/custum_list.dart';
import 'package:shashwat/Screen/tests/controller/test_controller.dart';
import 'package:shashwat/Widget/banner.dart';

class TestList extends StatefulWidget {
  const TestList({super.key});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  final controller = Get.find<TestController>();
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
                          controller.testListData.isEmpty
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
                                          (controller.testListData[index]
                                                          .time
                                                          .toString()  ==
                                                      "null" ||
                                                  controller.testListData[index]
                                                          .date
                                                          .toString() ==
                                                      "null")
                                              ? controller.hitInsertTimeApi(
                                                  controller
                                                      .testListData[index].id
                                                      .toString(),
                                                  getCurrentDate(),
                                                  getCurrentTime(),
                                                  index,
                                                )
                                              : compaireTime(
                                                      controller
                                                          .testListData[index]
                                                          .time
                                                          .toString(),
                                                      controller
                                                          .testListData[index]
                                                          .date
                                                          .toString(),
                                                      controller
                                                          .testListData[index]
                                                          .duration
                                                          .toString())
                                                  ? Get.toNamed(
                                                      '/testIntroduction',
                                                      arguments: [
                                                          {
                                                            'mediumID':
                                                                controller
                                                                    .mediumID,
                                                            'standerID':
                                                                controller
                                                                    .standerID,
                                                            'subjectID':
                                                                controller
                                                                    .subjectID,
                                                            'chapterID':
                                                                controller
                                                                    .chapterID,
                                                            'duration': controller
                                                                .testListData[
                                                                    index]
                                                                .duration
                                                                .toString(),
                                                            'totalMark':
                                                                controller
                                                                    .testListData[
                                                                        index]
                                                                    .total_marks
                                                                    .toString(),
                                                            'testID': controller
                                                                .testListData[
                                                                    index]
                                                                .id
                                                                .toString(),
                                                            'testName': controller
                                                                .testListData[
                                                                    index]
                                                                .name
                                                                .toString(),
                                                            'date': controller
                                                                .testListData[
                                                                    index]
                                                                .date
                                                                .toString(),
                                                            'time': controller
                                                                .testListData[
                                                                    index]
                                                                .time
                                                                .toString(),
                                                          }
                                                        ])
                                                  : showAlertDialog(
                                                      context,
                                                      controller
                                                          .testListData[index]
                                                          .date
                                                          .toString(),
                                                      controller
                                                          .testListData[index]
                                                          .time
                                                          .toString());
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 114,
                                                bottom: 10,
                                                top: 20,
                                                right: 114),
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
                                              padding:
                                                  const EdgeInsets.all(12.0),
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
                                            ),),
                                      ),
                                    );
                                  }),
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }

  TimeOfDay stringToTimeOfDay(String tod) {
    final format = DateFormat('hh:mm'); //"6:00"
    var t = TimeOfDay.fromDateTime(format.parse(tod)); //6:00
    // final dt = DateTime(t.hour, t.minute);
    // var s = DateFormat("hh:mm a").format(dt);
    // var st = DateFormat("hh:mm a").parse(s);
    print("t: $t");
    return t;
  }

  bool compaireTime(String time, String date, String duration) {
    TimeOfDay myTime = stringToTimeOfDay(time);
    print('myTime: $myTime');
    var endTime = myTime.replacing(
        hour: (myTime.hour + (int.parse(duration)) ~/ 60),
        minute: (myTime.minute + (int.parse(duration) % 60)));
    print('endTime: $endTime');
    var nowTime = TimeOfDay.now();
    var nowDate = DateTime.now();
    DateTime myDate = DateFormat("yyyy-MM-dd").parse(date);

    var dateToString = DateFormat("yyyy-MM-dd").format(nowDate);

    DateTime currentDate = DateFormat("yyyy-MM-dd").parse(dateToString);

    print(myTime);
    double _doubleYourTime =
        myTime.hour.toDouble() + (myTime.minute.toDouble() / 60);
    double _doubleEndTime =
        endTime.hour.toDouble() + (endTime.minute.toDouble() / 60);
    double _doubleNowTime =
        nowTime.hour.toDouble() + (nowTime.minute.toDouble() / 60);

    double _timeDiff = _doubleYourTime - _doubleNowTime;
    double _timeEndDiff = _doubleEndTime - _doubleNowTime;

    print("_timeDiff: $_timeDiff");
    print("_timeEndDiff: $_timeEndDiff");

    if (currentDate.isAtSameMomentAs(myDate)) {
      if (_timeDiff < 0 && _timeEndDiff > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      print('Date differ');
      return false;
    }
  }

  getTime12HrFormate(String time) {
    DateTime tempDate = DateFormat("hh:mm").parse(time);
    return DateFormat("hh:mm a").format(tempDate);
  }

  showAlertDialog(BuildContext context, String date, String time) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("ok"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        Get.back();
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Message"),
      content: Text("Test time is $date ${getTime12HrFormate(time)}"),
      actions: [
        cancelButton,
        // continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    var dateToString = DateFormat("yyyy-MM-dd").format(now);
    return dateToString;
  }

  String getCurrentTime() {
    DateTime now = DateTime.now();
    var dateToString = DateFormat("HH:mm").format(now);
    return dateToString;
  }
}
