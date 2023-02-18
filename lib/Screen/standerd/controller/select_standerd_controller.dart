import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/models/index.dart';

class SelectStanderdController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  var mediumID = '';
  RxBool isLoading = false.obs;
  var standerdListData = <StandardDetails>[].obs;
  var bannerListData = <BannerDetails>[].obs;
  SelectStanderdController() {
    _repo = Get.find<RepoImpl>();
    mediumID = Get.arguments[0]['id'];
    hitBannerApi();
    hitStanderdApi();
  }

  hitStanderdApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.getStandardListApi(mediumID);
      if (result != null) {
        standerdListData.value = result.standard;
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
