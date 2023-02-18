import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/auth/controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
