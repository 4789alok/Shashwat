import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';
import 'package:shashwat/models/index.dart';

class QuestionController extends GetxController {
  late TextEditingController inputController;
  late Repo _repo;
  var flag = false.obs;
  RxBool isLoading = false.obs;
  var mediumID = '';
  var standerID = '';
  var subjectID = '';
  var chapterID = '';
  var testID = '';
  var duration = '';
  var totalMark = '';
  var testName = '';
  var date = '';
  var time = '';
  var selectedAnswer = ''.obs;
  var index = 0.obs;
  var totalCorrectAnswer = 0.obs;
  var totalGettingMarks = 0.obs;
  var totalIncorrectAnswer = 0.obs;
  var totalUnanswerd = 0.obs;
  var count = 1.obs;
  var length = 0.obs;
  var questionListData = <QuestionDetails>[].obs;

  QuestionController() {
    _repo = Get.find<RepoImpl>();
    mediumID = Get.arguments[0]['mediumID'];
    standerID = Get.arguments[0]['standerID'];
    subjectID = Get.arguments[0]['subjectID'];
    chapterID = Get.arguments[0]['chapterID'];
    testID = Get.arguments[0]['testID'];
    duration = Get.arguments[0]['duration'];
    totalMark = Get.arguments[0]['totalMark'];
    testName = Get.arguments[0]['testName'];
    date = Get.arguments[0]['date'];
    time = Get.arguments[0]['time'];
    index.value = 0;
    count.value = 1;
    hitQuestionApi();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    inputController = TextEditingController();
  }

  hitQuestionApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.getQuestionsApi(
          mediumID, standerID, subjectID, chapterID, testID);
      // await _repo.getQuestionApi(box.read('id').toString(),subjectID,chapterID);
      if (result != null) {
        questionListData.value = result.question;
        length.value = questionListData.length;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  hitQuestionResponseApi(String questionID, String userAnswer,
      String givenAnswer, String givenMarks) async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.hitQuestionResponseApi(
          box.read('id').toString(),
          testID,
          questionID,
          userAnswer,
          date,
          time);
      // await _repo.getQuestionApi(box.read('id').toString(),subjectID,chapterID);
      if (result != null) {
        if (count == length) {
          calculateAnswer(userAnswer, givenAnswer, givenMarks);
          hitResultStoreApi();
        } else {
          calculateAnswer(userAnswer, givenAnswer, givenMarks);
          incressIndex();
        }
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  hitResultStoreApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.hitResultStoreApi(
          box.read('id').toString(),
          testID,
          totalMark,
          totalCorrectAnswer.value.toString(),
          totalIncorrectAnswer.toString(),
          totalUnanswerd.toString(),
          totalGettingMarks.toString(),
          date,
          time);
      // await _repo.getQuestionApi(box.read('id').toString(),subjectID,chapterID);
      if (result != null) {
        Get.offNamed('/result', arguments: [
          {
            'testID': testID,
            'subjectID': subjectID,
            'chapterID': chapterID.toString(),
            'testName': testName.toString(),
            'date': date.toString(),
            'time': time.toString(),
          }
        ]);
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  incressIndex() {
    if (index < length.value) {
      index.value = index.value + 1;
      count.value = count.value + 1;
      print('count: ${count.value}');
      print('index: ${index.value}');
      print('answer: $selectedAnswer');
    }
  }

  dicressIndex() {
    if (index.value > 0) {
      index.value = index.value - 1;
      count.value = count.value - 1;
      print('count: ${count.value}');
      print('index: ${index.value}');
    } else {
      print('dicrement not posible');
    }
  }

  calculateAnswer(String userAnswer, String givenAnswer, String givenMarks) {
    if (userAnswer == givenAnswer) {
      selectedAnswer.value = '';
      totalCorrectAnswer.value = totalCorrectAnswer.value + 1;
      totalGettingMarks.value = int.parse(givenMarks) + totalGettingMarks.value;
      print('totalCorrectAnswer $totalCorrectAnswer');
    } else if (userAnswer == '') {
      selectedAnswer.value = '';
      totalUnanswerd.value = totalUnanswerd.value + 1;
      print('totalUnanswerd $totalUnanswerd');
    } else {
      selectedAnswer.value = '';
      totalIncorrectAnswer.value = totalIncorrectAnswer.value + 1;
      print('totalIncorrectAnswer $totalIncorrectAnswer');
    }
  }
}
