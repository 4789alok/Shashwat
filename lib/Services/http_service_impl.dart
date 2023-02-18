import 'package:dio/dio.dart';
import 'package:shashwat/Services/http_service.dart';

const BASE_URL = "https://shashwatinternationalschool.org/devapp/public/";

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      print(error.message);
      return handler.next(error);
    }, onRequest: (request, handler) {
      print('${request.method} | ${request.path} | ${request.data}');
      return handler.next(request);
    }, onResponse: (response, handler) {
      print(
          "${response.statusCode} | ${response.statusMessage} | ${response.data}");
      return handler.next(response);
    }));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL));
    initializeInterceptors();
  }

  @override
  Future<Response> getChapterListApi(
      String url, String mediumID, String standardID, String subjectID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'medium_id': mediumID,
        'standard_id': standardID,
        'subject_id': subjectID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getMediumListApi(String url) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getProfileApi(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getStandardListApi(String url, String mediumID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'medium_id': mediumID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getSubjectListApi(
      String url, String mediumID, String standardID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'medium_id': mediumID,
        'standard_id': standardID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getTestListApi(String url, String mediumID,
      String standardID, String subjectID, String chapterID) async {
    // TODO: implement getSingIn 
    Response response;
    try {
      response = await _dio.post(url, data: {
        'medium_id': mediumID,
        'standard_id': standardID,
        'subject_id': subjectID,
        'chapter_id': chapterID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
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
      String mobile) async {
    // TODO: implement getSingIn 
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'dob': dob,
        'standard': standard,
        'school_name': schoolName,
        'recent_percentage': percentage,
        'hobbies': hobbies,
        'address': address,
        'pin_code': pinCode,
        'name': name,
        'mobile': mobile,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitLoginApi(
      String url, String email, String password) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'email': email,
        'password': password,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
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
      String mobile) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'dob': dob,
        'standard': standard,
        'school_name': schoolName,
        'recent_percentage': percentage,
        'hobbies': hobbies,
        'address': address,
        'pin_code': pinCode,
        'mobile': mobile,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitRegisterApi(
      String url, String name, String email, String password) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getResultChapterWiseApi(
      String url, String userID, String subjectID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'subject_id': subjectID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getResultSubjectWiseApi(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getResultApi(String url, String userID, String testID,
      String date, String time) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'test_id': testID,
        'test_date': date,
        'test_time': time,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getResultTestWiseApi(
      String url, String userID, String subjectID, String chapterID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'subject_id': subjectID,
        'chapter_id': chapterID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getBannerApi(String url) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getNoticeApi(String url) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getQuestionsApi(
      String url,
      String mediumID,
      String standardID,
      String subjectID,
      String chapterID,
      String testID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'medium_id': mediumID,
        'standard_id': standardID,
        'subject_id': subjectID,
        'chapter_id': chapterID,
        'test': testID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitQuestionResponseApi(
      String url,
      String userID,
      String testID,
      String questionID,
      String userAnswer,
      String date,
      String time) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'test_id': testID,
        'question_id': questionID,
        'answer': userAnswer,
        'date': date,
        'time': time,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getAnswerListApi(String url, String userID, String testID,
      String date, String time) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'test_id': testID,
        'date': date,
        'time': time,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
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
      String time) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'test_id': testID,
        'total_marks': totalMark,
        'correct_answer': totalCorrectAnswer,
        'incorrect': totalIncorrectAnswer,
        'unaswered': totalUnanswerd,
        'correct_total': correctMarks,
        'test_date': date,
        'test_time': time,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitFetchTimeApi(
      String url, String userID, String testID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'test_id': testID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitTimeInsertApi(String url, String userID, String testID,
      String date, String time) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'test_id': testID,
        'date': date,
        'time': time,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
