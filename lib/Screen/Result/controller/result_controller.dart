import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';
import 'package:shashwat/models/index.dart';

class ResultController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  var testID = '';
  var testName = '';
  var subjectID = '';
  var chapterID = '';
  var totalMark = ''.obs;
  var correctTotalMark = ''.obs;
  var date = '';
  var time = '';
  var correctAnswer = ''.obs;
  var incorrectAnswer = ''.obs;
  var unAnswer = ''.obs;
  RxMap<String, double> dataMap = <String, double>{}.obs;
  var answerListData = <AnswerListDetails>[].obs;
  RxBool isLoading = false.obs;
  ResultController() {
    _repo = Get.find<RepoImpl>();
    subjectID = Get.arguments[0]['subjectID'];
    chapterID = Get.arguments[0]['chapterID'];
    testID = Get.arguments[0]['testID'];
    testName = Get.arguments[0]['testName'];
    date = Get.arguments[0]['date'];
    time = Get.arguments[0]['time'];
    hitChapterApi();
    hitAnswerListApi();
  }

  hitChapterApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      // final result = await _repo.getResultApi(box.read(key), testID);
      final result = await _repo.getResultApi(
          box.read('id').toString(), testID, date, time);
      if (result != null) {
        totalMark.value = result.result.total_marks.toString();
        unAnswer.value = result.result.unaswered.toString();
        incorrectAnswer.value = result.result.incorrect.toString();
        correctAnswer.value = result.result.correct_answer.toString();
        correctTotalMark.value = result.result.correct_total.toString();
        dataMap.value = {
          "Correct": double.parse(correctTotalMark.value),
          "Incorrect": double.parse(incorrectAnswer.value),
          "Unanswerd": double.parse(unAnswer.value),
        };
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  hitAnswerListApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      // final result = await _repo.getResultApi(box.read(key), testID);
      final result = await _repo.getAnswerListApi(
          box.read('id').toString(), testID, date, time);
      if (result != null) {
        answerListData.value = result.question;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }
}
