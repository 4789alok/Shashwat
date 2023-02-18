import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/models/index.dart';

class SelectChapterController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  var mediumID = '';
  var standerID = '';
  var subjectID = '';
  RxBool isLoading = false.obs;
  var chapterListData = <ChapterDetails>[].obs;
  var bannerListData = <BannerDetails>[].obs;
  SelectChapterController() {
    _repo = Get.find<RepoImpl>();
    mediumID = Get.arguments[0]['mediumID'];
    standerID = Get.arguments[0]['standerID'];
    subjectID = Get.arguments[0]['subjectID'];
    hitChapterApi();
  }

  hitChapterApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result =
          await _repo.getChapterListApi(mediumID, standerID, subjectID);
      if (result != null) {
        chapterListData.value = result.chapter;
        bannerListData.value = result.slider!;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }
}
