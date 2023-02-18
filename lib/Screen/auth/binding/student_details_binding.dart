import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/auth/controller/student_details_controller.dart';

class StudentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<StudentDetailsController>(() => StudentDetailsController());
  }
}
