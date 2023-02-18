import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/subjects/controller/select_subject_controller.dart';

class SubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<SubjectController>(() => SubjectController());
  }
}
