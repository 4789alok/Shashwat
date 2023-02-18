import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/result_date_wise/controller/result_date_wise_controller.dart';

class ResultDateWiseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<ResultDateWiseController>(() => ResultDateWiseController());
  }
}
