import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Services/http_service.dart';
import 'package:shashwat/Services/http_service_impl.dart';
import 'package:shashwat/models/index.dart';
import 'package:shashwat/models/questionData.dart';
import 'package:shashwat/models/noticeData.dart';
import 'package:shashwat/models/bannerData.dart';
import 'package:shashwat/models/questionResponseData.dart';
import 'package:shashwat/models/resultData.dart';
import 'package:shashwat/models/userData.dart';
import 'package:shashwat/models/testData.dart';
import 'package:shashwat/models/subjectData.dart';
import 'package:shashwat/models/standardData.dart';
import 'package:shashwat/models/mediumData.dart';
import 'package:shashwat/models/chapterData.dart';

class RepoImpl implements Repo {
  late HttpService _httpService;
  RepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<ChapterData?> getChapterListApi(
      String mediumID, String standardID, String subjectID) async {
    try {
      final response = await _httpService.getChapterListApi(
          'api/chapter', mediumID, standardID, subjectID);
      final parsedResponse = ChapterData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<MediumData?> getMediumListApi() async {
    try {
      final response = await _httpService.getMediumListApi('api/medium');
      final parsedResponse = MediumData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserData?> getProfileApi(String userID) async {
    try {
      final response =
          await _httpService.getProfileApi('api/student-profile', userID);
      final parsedResponse = UserData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<StandardData?> getStandardListApi(String mediumID) async {
    try {
      final response =
          await _httpService.getStandardListApi('api/standard', mediumID);
      final parsedResponse = StandardData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<SubjectData?> getSubjectListApi(
      String mediumID, String standardID) async {
    try {
      final response = await _httpService.getSubjectListApi(
          'api/subject', mediumID, standardID);
      final parsedResponse = SubjectData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<TestData?> getTestListApi(String mediumID, String standardID,
      String subjectID, String chapterID) async {
    try {
      final response = await _httpService.getTestListApi(
          'api/test', mediumID, standardID, subjectID, chapterID);
      final parsedResponse = TestData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserData?> hitEditProfileApi(
      String userID,
      String dob,
      String standard,
      String schoolName,
      String percentage,
      String hobbies,
      String address,
      String pinCode,
      String name,
      String mobile) async {
    try {
      final response = await _httpService.hitEditProfileApi(
          'api/student-profile-update',
          userID,
          dob,
          standard,
          schoolName,
          percentage,
          hobbies,
          address,
          pinCode,
          name,
          mobile);
      final parsedResponse = UserData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserData?> hitLoginApi(String email, String password) async {
    try {
      final response =
          await _httpService.hitLoginApi('api/login', email, password);
      final parsedResponse = UserData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserData?> hitRegisterAllDataApi(
    String userID,
    String dob,
    String standard,
    String schoolName,
    String percentage,
    String hobbies,
    String address,
    String pinCode,
    String mobile,
  ) async {
    try {
      final response = await _httpService.hitRegisterAllDataApi(
          'api/register-student-all-detail-store',
          userID,
          dob,
          standard,
          schoolName,
          percentage,
          hobbies,
          address,
          pinCode,
          mobile);
      final parsedResponse = UserData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserData?> hitRegisterApi(
      String name, String email, String password) async {
    try {
      final response = await _httpService.hitRegisterApi(
          'api/register-student', name, email, password);
      final parsedResponse = UserData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ChapterData?> getResultChapterWiseApi(
      String userID, String subjectID) async {
    try {
      final response = await _httpService.getResultChapterWiseApi(
          'api/result-chapter', userID, subjectID);
      final parsedResponse = ChapterData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<SubjectData?> getResultSubjectWiseApi(String userID) async {
    try {
      final response = await _httpService.getResultSubjectWiseApi(
          'api/result-subject', userID);
      final parsedResponse = SubjectData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ResultData?> getResultApi(
      String userID, String testID, String date, String time) async {
    try {
      final response = await _httpService.getResultApi(
          'api/result', userID, testID, date, time);
      final parsedResponse = ResultData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<TestData?> getResultTestWiseApi(
      String userID, String subjectID, String chapterID) async {
    try {
      final response = await _httpService.getResultTestWiseApi(
          'api/result-test', userID, subjectID, chapterID);
      final parsedResponse = TestData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<BannerData?> getBannerApi() async {
    try {
      final response = await _httpService.getBannerApi('api/slider');
      final parsedResponse = BannerData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<NoticeData?> getNoticeApi() async {
    try {
      final response = await _httpService.getNoticeApi('api/news');
      final parsedResponse = NoticeData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<QuestionData?> getQuestionsApi(String mediumID, String standardID,
      String subjectID, String chapterID, String testID) async {
    try {
      final response = await _httpService.getQuestionsApi(
          'api/question', mediumID, standardID, subjectID, chapterID, testID);
      final parsedResponse = QuestionData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AnswerListData?> getAnswerListApi(
      String userID, String testID, String date, String time) async {
    try {
      final response = await _httpService.getAnswerListApi(
          'api/user-answer-view', userID, testID, date, time);
      final parsedResponse = AnswerListData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<QuestionResponseData?> hitQuestionResponseApi(
      String userID,
      String testID,
      String questionID,
      String userAnswer,
      String date,
      String time) async {
    try {
      final response = await _httpService.hitQuestionResponseApi(
          'api/user-answer',
          userID,
          testID,
          questionID,
          userAnswer,
          date,
          time);
      final parsedResponse = QuestionResponseData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ResultData?> hitResultStoreApi(
    String userID,
    String testID,
    String totalMark,
    String totalCorrectAnswer,
    String totalIncorrectAnswer,
    String totalUnanswerd,
    String correctMarks,
    String date,
    String time,
  ) async {
    try {
      final response = await _httpService.hitResultStoreApi(
          'api/result-store',
          userID,
          testID,
          totalMark,
          totalCorrectAnswer,
          totalIncorrectAnswer,
          totalUnanswerd,
          correctMarks,
          date,
          time);
      final parsedResponse = ResultData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<FetchTimeData?> hitFetchTimeApi(String userID, String testID) async {
    try {
      final response = await _httpService.hitFetchTimeApi(
          'api/user-test-date-time', userID, testID);
      final parsedResponse = FetchTimeData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<InsertTimeData?> hitTimeInsertApi(
      String userID, String testID, String date, String time) async {
    try {
      final response = await _httpService.hitTimeInsertApi(
          'api/user-test-time', userID, testID, date, time);
      final parsedResponse = InsertTimeData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
