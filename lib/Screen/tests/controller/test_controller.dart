import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';
import 'package:shashwat/models/index.dart';

class TestController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  RxBool isLoading = false.obs;
  var mediumID = '';
  var standerID = '';
  var subjectID = '';
  var chapterID = '';
  var duration = '';
  var date = '';
  var time = '';
  var testListData = <TestDetails>[].obs;
  TestController() {
    _repo = Get.find<RepoImpl>();
    mediumID = Get.arguments[0]['mediumID'];
    standerID = Get.arguments[0]['standerID'];
    subjectID = Get.arguments[0]['subjectID'];
    chapterID = Get.arguments[0]['chapterID'];
    hitBannerApi();
    hitTestApi();
  }

  hitTestApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result =
          await _repo.getTestListApi(mediumID, standerID, subjectID, chapterID);
      // await _repo.getTestApi(box.read('id').toString(),subjectID,chapterID);
      if (result != null) {
        testListData.value = result.test;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  hitInsertTimeApi(String testID, String date, String time, int index) async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.hitTimeInsertApi(
          box.read('id').toString(), testID, date, time);
      // await _repo.getTestApi(box.read('id').toString(),subjectID,chapterID);
      if (result != null) {
        // date = result.datetime.date.toString();
        // time = result.datetime.time.toString();
        Get.toNamed('/testIntroduction', arguments: [
          {
            'mediumID': mediumID,
            'standerID': standerID,
            'subjectID': subjectID,
            'chapterID': chapterID,
            'duration': testListData[index].duration.toString(),
            'totalMark': testListData[index].total_marks.toString(),
            'testID': testListData[index].id.toString(),
            'testName': testListData[index].name.toString(),
            'date': result.datetime.date.toString(),
            'time': result.datetime.time.toString(),
          }
        ]);
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  var bannerListData = <BannerDetails>[].obs;
  hitBannerApi() async {
    // var token = await getToken();
    // isLoading.toggle();
    print('start');
    try {
      final result = await _repo.getBannerApi();
      if (result != null) {
        bannerListData.value = result.slider;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      // isLoading.toggle();
    }
  }
}
