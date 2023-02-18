import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';

class MailVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    // Get.lazyPut<MailVerifyController>(() => MailVerifyController());
  }
}
