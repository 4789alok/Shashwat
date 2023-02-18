import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/models/index.dart';

class MediumController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  RxBool isLoading = false.obs;
  var mediumListData = <MediumDetails>[].obs;
  var bannerListData = <BannerDetails>[].obs;
  MediumController() {
    _repo = Get.find<RepoImpl>();
    hitMediumApi();
    hitBannerApi();
  }

  hitMediumApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.getMediumListApi();
      if (result != null) {
        mediumListData.value = result.medium;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  hitBannerApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.getBannerApi();
      if (result != null) {
        bannerListData.value = result.slider;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }
}
