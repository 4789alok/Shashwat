import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/models/index.dart';

class HomeController extends GetxController {
  late Repo _repo;
  var flag = false.obs;
  var checkData = "".obs;
  RxBool isLoading2 = false.obs;
  var noticeListData = <NoticeDetails>[].obs;
  var bannerListData = <BannerDetails>[].obs;
  HomeController() {
    _repo = Get.find<RepoImpl>();
    hitBannerApi();
    hitNoticeApi();
  }

  @override
  void onInit() {
    super.onInit();
    final newVersion =
        NewVersion(androidId: "com.shashwatinternationalschool.shashwat");
    newVersion.showAlertIfNecessary(context: Get.context!);
  }

  hitNoticeApi() async {
    // var token = await getToken();
    isLoading2.toggle();
    print('start');
    try {
      final result = await _repo.getNoticeApi();
      if (result != null) {
        checkData.value = 'check';
        noticeListData.value = result.news;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading2.toggle();
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
