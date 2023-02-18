import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';
import 'package:shashwat/models/index.dart';

class ResultChapterWiseController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  var subjectID = '';
  RxBool isLoading = false.obs;
  var chapterListData = <ChapterDetails>[].obs;
  ResultChapterWiseController() {
    _repo = Get.find<RepoImpl>();
    subjectID = Get.arguments[0]['subjectID'];
    hitBannerApi();
    hitChapterApi();
  }

  hitChapterApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result =
          // await _repo.getResultChapterWiseApi("2", subjectID);
          await _repo.getResultChapterWiseApi(
              box.read('id').toString(), subjectID);
      if (result != null) {
        chapterListData.value = result.chapter;
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
