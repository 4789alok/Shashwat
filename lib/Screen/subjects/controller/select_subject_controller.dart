import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/models/index.dart';

class SubjectController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  var mediumID = '';
  var standerID = '';
  RxBool isLoading = false.obs;
  var subjectListData = <SubjectDetails>[].obs;
  var bannerListData = <BannerDetails>[].obs;
  SubjectController() {
    _repo = Get.find<RepoImpl>();
    mediumID = Get.arguments[0]['mediumID'];
    standerID = Get.arguments[0]['standerID'];
    hitBannerApi();
    hitSubjectdApi();
  }

  hitSubjectdApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.getSubjectListApi(mediumID, standerID);
      if (result != null) {
        subjectListData.value = result.subject;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

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
