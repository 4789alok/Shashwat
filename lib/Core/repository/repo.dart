import 'package:shashwat/models/index.dart';

abstract class Repo {
  Future<MediumData?> getMediumListApi();
  Future<StandardData?> getStandardListApi(String mediumID);
  Future<SubjectData?> getSubjectListApi(String mediumID, String standardID);
  Future<ChapterData?> getChapterListApi(
      String mediumID, String standardID, String subjectID);
  Future<TestData?> getTestListApi(
      String mediumID, String standardID, String subjectID, String chapterID);
  Future<UserData?> hitRegisterApi(String name, String email, String password);
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
  );
  Future<UserData?> hitLoginApi(String email, String password);
  Future<UserData?> getProfileApi(String userID);
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
      String mobile);

  Future<SubjectData?> getResultSubjectWiseApi(String userID);
  Future<ChapterData?> getResultChapterWiseApi(String userID, String subjectID);
  Future<TestData?> getResultTestWiseApi(
      String userID, String subjectID, String chapterID);
  Future<ResultData?> getResultApi(
      String userID, String testID, String date, String time);
  Future<BannerData?> getBannerApi();
  Future<NoticeData?> getNoticeApi();
  Future<QuestionData?> getQuestionsApi(String mediumID, String standardID,
      String subjectID, String chapterID, String testID);
  Future<QuestionResponseData?> hitQuestionResponseApi(
      String userID,
      String testID,
      String questionID,
      String userAnswer,
      String date,
      String time);
  Future<AnswerListData?> getAnswerListApi(
      String userID, String testID, String date, String time);
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
  );
  Future<InsertTimeData?> hitTimeInsertApi(
      String userID, String testID, String date, String time);
  Future<FetchTimeData?> hitFetchTimeApi(String userID, String testID);
}
