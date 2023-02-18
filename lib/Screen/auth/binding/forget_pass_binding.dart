import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';

class ForgetPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    // Get.lazyPut<ForgetPassController>(() => ForgetPassController());
  }
}
