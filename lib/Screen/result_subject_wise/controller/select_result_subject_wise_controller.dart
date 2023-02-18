import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';
import 'package:shashwat/models/index.dart';

class ResultSubjectWiseController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  RxBool isLoading = false.obs;
  var subjectListData = <SubjectDetails>[].obs;
  ResultSubjectWiseController() {
    _repo = Get.find<RepoImpl>();
    hitBannerApi();
    hitSubjectdApi();
  }

  hitSubjectdApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result =
          //await _repo.getResultSubjectWiseApi("2");
          await _repo.getResultSubjectWiseApi(box.read('id').toString());
      if (result != null) {
        subjectListData.value = result.subject;
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
