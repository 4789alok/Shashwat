import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/standerd/controller/select_standerd_controller.dart';

class StanderdBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<SelectStanderdController>(() => SelectStanderdController());
  }
}
