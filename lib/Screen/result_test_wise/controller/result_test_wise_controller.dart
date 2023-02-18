import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';
import 'package:shashwat/models/index.dart';

class ResultTestWiseController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  RxBool isLoading = false.obs;
  var subjectID = '';
  var chapterID = '';
  var testListData = <TestDetails>[].obs;
  ResultTestWiseController() {
    _repo = Get.find<RepoImpl>();
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
          // await _repo.getResultTestWiseApi("2", subjectID, chapterID);
          await _repo.getResultTestWiseApi(
              box.read('id').toString(), subjectID, chapterID);
      if (result != null) {
        testListData.value = result.test;
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
