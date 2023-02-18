import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/result_subject_wise/controller/select_result_subject_wise_controller.dart';

class ResultSubjectWiseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<ResultSubjectWiseController>(
        () => ResultSubjectWiseController());
  }
}
