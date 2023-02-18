import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shashwat/Screen/Result/controller/result_controller.dart';
import 'package:shashwat/Screen/download_page/pdf_download.dart';

class OneChapter_Result extends StatefulWidget {
  const OneChapter_Result({super.key});

  @override
  State<OneChapter_Result> createState() => _OneChapter_ResultState();
}

class _OneChapter_ResultState extends State<OneChapter_Result> {
  // late DownloaderUtils options;
  // late DownloaderCore core;
  // late final String path;

  // downloadPaper(BuildContext context, String subjectID, String chapterID,
  //     String userID, String testID, String testName) async {
  //   var url =
  //       "https://shashwatinternationalschool.org/devapp/public/api/user-answer-pdf?subject_id=$subjectID&chapter_id=$chapterID&test_id=$testID&&user_id=$userID";

  //   options = DownloaderUtils(
  //     progressCallback: (current, total) {
  //       final progress = (current / total) * 100;
  //       print('Downloading: $progress');
  //     },
  //     file: File('$path/${'Test${DateTime.now().millisecond}'}'),
  //     progress: ProgressImplementation(),
  //     onDone: () {
  //       OpenFile.open('$path/${'Test${DateTime.now().millisecond}'}')
  //           .then((value) {
  //         // delete the file.
  //         File f = File('$path/${'Test${DateTime.now().millisecond}'}');
  //         f.delete();
  //       });
  //     },
  //     deleteOnCancel: true,
  //   );
  //   core = await Flowder.download(
  //     url,
  //     options,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResultController>();

    final colorList = <Color>[
      Colors.green,
      Colors.red,
      Colors.grey,
    ];
    return Obx(() {
      return controller.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Text(
                          'Overview',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 6, right: 6),
                        color: const Color(0xFF033d73),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            'Summary of marks scored in the attempted',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Chapter Wise Score',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF033d73),
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Obx(() {
                    return controller.dataMap.isEmpty
                        ? const SizedBox.shrink()
                        : PieChart(
                            dataMap: controller.dataMap.value,
                            animationDuration:
                                const Duration(milliseconds: 800),
                            chartLegendSpacing: 42,
                            chartRadius: MediaQuery.of(context).size.width / 2,
                            colorList: colorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 60,

                            centerText: "Answer",
                            legendOptions: const LegendOptions(
                              showLegendsInRow: true,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.rectangle,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Times New Roman",
                              ),
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesInPercentage: false,
                                showChartValuesOutside: true,
                                decimalPlaces: 1,
                                chartValueStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                            // gradientList: ---To add gradient colors---
                            // emptyColorGradient: ---Empty Color gradient---
                          );
                  }),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(top: 20.0, left: 10, right: 20),
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Expanded(
                  //             child: Container(
                  //               height: 150,
                  //               margin: const EdgeInsets.all(8.0),
                  //               padding: const EdgeInsets.all(20),
                  //               decoration: const BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 color: Color(0xFF033d73),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceEvenly,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   const Text(
                  //                     'Total marks scored',
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 16,
                  //                       letterSpacing: 1.5,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontFamily: "Times New Roman",
                  //                     ),
                  //                     textAlign: TextAlign.center,
                  //                   ),
                  //                   const Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                       horizontal: 25,
                  //                     ),
                  //                     child: Divider(
                  //                       thickness: 0.3,
                  //                       height: 10,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     '${controller.correctTotalMark.value}/${controller.totalMark.value}',
                  //                     style: const TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 24,
                  //                       //fontWeight: FontWeight.bold,
                  //                       fontFamily: "Times New Roman",
                  //                     ),
                  //                     // textAlign: TextAlign.center,
                  //                   ),
                  //                   // ignore: avoid_unnecessary_containers
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Container(
                  //               height: 150,
                  //               margin: const EdgeInsets.all(8.0),
                  //               padding: const EdgeInsets.all(20),
                  //               decoration: const BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 color: Color(0xFF033d73),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceEvenly,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   const Text(
                  //                     'Correct',
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 16,
                  //                       letterSpacing: 1.5,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontFamily: "Times New Roman",
                  //                     ),
                  //                     textAlign: TextAlign.center,
                  //                   ),
                  //                   const Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                       horizontal: 25,
                  //                     ),
                  //                     child: Divider(
                  //                       thickness: 0.3,
                  //                       height: 10,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     controller.correctAnswer.value,
                  //                     style: const TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 24,
                  //                       //fontWeight: FontWeight.bold,
                  //                       fontFamily: "Times New Roman",
                  //                     ),
                  //                     // textAlign: TextAlign.center,
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //       Row(
                  //         children: [
                  //           Expanded(
                  //             child: Container(
                  //               height: 150,
                  //               margin: const EdgeInsets.all(8.0),
                  //               padding: const EdgeInsets.all(20),
                  //               decoration: const BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 color: Color(0xFF033d73),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceEvenly,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   const Text(
                  //                     'Incorrect',
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 16,
                  //                       letterSpacing: 1.5,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontFamily: "Times New Roman",
                  //                     ),
                  //                     textAlign: TextAlign.center,
                  //                   ),
                  //                   const Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                       horizontal: 25,
                  //                     ),
                  //                     child: Divider(
                  //                       thickness: 0.3,
                  //                       height: 10,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     controller.incorrectAnswer.value,
                  //                     style: const TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 24,
                  //                       //fontWeight: FontWeight.bold,
                  //                       fontFamily: "Times New Roman",
                  //                     ),
                  //                     // textAlign: TextAlign.center,
                  //                   ),
                  //                   // ignore: avoid_unnecessary_containers
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Container(
                  //               height: 150,
                  //               margin: const EdgeInsets.all(8.0),
                  //               padding: const EdgeInsets.all(20),
                  //               decoration: const BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 color: Color(0xFF033d73),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceEvenly,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   const Text(
                  //                     'Unanswerd',
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 16,
                  //                       letterSpacing: 1.5,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontFamily: "Times New Roman",
                  //                     ),
                  //                     textAlign: TextAlign.center,
                  //                   ),
                  //                   const Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                       horizontal: 25,
                  //                     ),
                  //                     child: Divider(
                  //                       thickness: 0.3,
                  //                       height: 10,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     controller.unAnswer.value,
                  //                     style: const TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 24,
                  //                       //fontWeight: FontWeight.bold,
                  //                       fontFamily: "Times New Roman",
                  //                     ),
                  //                     // textAlign: TextAlign.center,
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => DownloadingDialog(
                        subjectID: controller.subjectID,
                        chapterID: controller.chapterID,
                        testID: controller.testID,
                        date: controller.date,
                        time: controller.time,
                        type: 'question',
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF033d73),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Download Test Question Paper",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => DownloadingDialog(
                        subjectID: controller.subjectID,
                        chapterID: controller.chapterID,
                        testID: controller.testID,
                        date: controller.date,
                        time: controller.time,
                        type: 'answer',
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF033d73),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Download Test Answer Paper",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            );
    });
  }
}

//final file = File('example.pdf');
//await file.writeAsBytes(await pdf.save());

// void openPdf(BuildContext context, File file, String url, String testName) =>
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => PdfDownload(
//           file: file,
//           url: url,
//           fileName: testName,
//         ),
//       ),
//     );

final List<Map<String, dynamic>> result = [
  {"classes": "Total marks scored", "classes1": "80/100 marks"},
  {"classes": "Correct", "classes1": "40 Answer"},
  {"classes": "Incorrect", "classes1": "10 Answer"},
  {"classes": "Unanswered", "classes1": "0"},
];
