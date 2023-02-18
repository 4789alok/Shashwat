import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/profile/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
