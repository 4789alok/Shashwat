import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/dashboard/controller/dashboard_controller.dart';
import 'package:shashwat/Screen/home/controller/home_controller.dart';
import 'package:shashwat/Screen/medium/controller/select_medium_controller.dart';
import 'package:shashwat/Screen/profile/controller/profile_controller.dart';
import 'package:shashwat/Screen/result_subject_wise/controller/select_result_subject_wise_controller.dart';

class DeshboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.lazyPut<DeshboardController>(() => DeshboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<MediumController>(() => MediumController());
    Get.lazyPut<ResultSubjectWiseController>(
        () => ResultSubjectWiseController());
  }
}
