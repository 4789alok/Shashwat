import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';
import 'package:shashwat/models/index.dart';

class ResultDateWiseController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  RxBool isLoading = false.obs;
  var subjectID = '';
  var chapterID = '';
  var testID = '';
  var testName = '';
  var timeListData = <TimeDetails>[].obs;
  ResultDateWiseController() {
    _repo = Get.find<RepoImpl>();
    subjectID = Get.arguments[0]['subjectID'];
    chapterID = Get.arguments[0]['chapterID'];
    testID = Get.arguments[0]['testID'];
    testName = Get.arguments[0]['testName'];
    hitBannerApi();
    hitTestApi();
  }

  hitTestApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result =
          // await _repo.getResultDateWiseApi("2", subjectID, chapterID);
          await _repo.hitFetchTimeApi(box.read('id').toString(), testID);
      if (result != null) {
        timeListData.value = result.datetime;
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
