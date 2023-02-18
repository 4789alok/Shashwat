import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/result_test_wise/controller/result_test_wise_controller.dart';

class ResultTestWiseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<ResultTestWiseController>(() => ResultTestWiseController());
  }
}
