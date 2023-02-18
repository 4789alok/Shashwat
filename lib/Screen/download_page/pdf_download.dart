import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shashwat/constant/constants.dart';

class DownloadingDialog extends StatefulWidget {
  // final String mediumID;
  // final String standardID;
  final String subjectID;
  final String chapterID;
  final String testID;
  final String date;
  final String time;
  final String type;
  const DownloadingDialog({
    Key? key,
    // required this.mediumID,
    // required this.standardID,
    required this.subjectID,
    required this.chapterID,
    required this.testID,
    required this.date,
    required this.time,
    required this.type,
  }) : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    String url = widget.type == 'answer'
        ? "https://shashwatinternationalschool.org/devapp/public/api/user-answer-pdf?subject_id=${widget.subjectID}&chapter_id=${widget.chapterID}&test_id=${widget.testID}&user_id=${box.read('id').toString()}&time=${widget.time}&date=${widget.date}"
        // : "https://shashwatinternationalschool.org/devapp/public/api/question-answer-pdf?medium_id=${widget.mediumID}&standard_id=${widget.standardID}&subject_id=${widget.subjectID}&chapter_id=${widget.chapterID}&test_id=${widget.testID}";
        : "https://shashwatinternationalschool.org/devapp/public/api/question-answer-pdf?subject_id=${widget.subjectID}&chapter_id=${widget.chapterID}&test_id=${widget.testID}";

    String fileName = widget.type == 'answer'
        ? "TestAnswer_${DateTime.now().microsecond.toString()}.pdf"
        : "TestQuestion_${DateTime.now().microsecond.toString()}.pdf";

    String? path = await _getFilePath(fileName);

    await dio.download(
      url,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });

        print(progress);
        print(path);
      },
      deleteOnError: true,
    ).then((_) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            const Expanded(
              child: Text(
                'File Downloaded successfully',
                style: TextStyle(color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await OpenFile.open('/storage/emulated/0/Download/$fileName');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'View',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ));
    });
  }

  Future<String?> _getFilePath(String filename) async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists())
          directory = await getExternalStorageDirectory();
      }
    } catch (err, stack) {
      print("Cannot get download folder path");
    }
    return "${directory?.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
