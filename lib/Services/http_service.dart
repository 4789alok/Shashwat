import 'package:dio/dio.dart';

abstract class HttpService {
  void init();

  Future<Response> getMediumListApi(String url);
  Future<Response> getStandardListApi(String url, String mediumID);
  Future<Response> getSubjectListApi(
      String url, String mediumID, String standardID);
  Future<Response> getChapterListApi(
      String url, String mediumID, String standardID, String subjectID);
  Future<Response> getTestListApi(String url, String mediumID,
      String standardID, String subjectID, String chapterID);
  Future<Response> hitRegisterApi(
      String url, String name, String email, String password);
  Future<Response> hitRegisterAllDataApi(
    String url,
    String userID,
    String dob,
    String standard,
    String schoolName,
    String percentage,
    String hobbies,
    String address,
    String pinCode,
    String mobile,
  );
  Future<Response> hitLoginApi(String url, String email, String password);
  Future<Response> getProfileApi(String url, String userID);
  Future<Response> hitEditProfileApi(
      String url,
      String userID,
      String dob,
      String standard,
      String schoolName,
      String percentage,
      String hobbies,
      String address,
      String pinCode,
      String name,
      String mobile);
  Future<Response> getResultSubjectWiseApi(String url, String userID);
  Future<Response> getResultChapterWiseApi(
      String url, String userID, String subjectID);
  Future<Response> getResultTestWiseApi(
      String url, String userID, String subjectID, String chapterID);
  Future<Response> getResultApi(
      String url, String userID, String testID, String date, String time);
  Future<Response> getBannerApi(String url);
  Future<Response> getNoticeApi(String url);
  Future<Response> getQuestionsApi(String url, String mediumID,
      String standardID, String subjectID, String chapterID, String testID);
  Future<Response> hitQuestionResponseApi(
      String url,
      String userID,
      String testID,
      String questionID,
      String userAnswer,
      String date,
      String time);
  Future<Response> getAnswerListApi(
      String url, String userID, String testID, String date, String time);
  Future<Response> hitResultStoreApi(
      String url,
      String userID,
      String testID,
      String totalMark,
      String totalCorrectAnswer,
      String totalIncorrectAnswer,
      String totalUnanswerd,
      String correctMarks,
      String date,
      String time);
  Future<Response> hitTimeInsertApi(
      String url, String userID, String testID, String date, String time);
  Future<Response> hitFetchTimeApi(String url, String userID, String testID);
}
