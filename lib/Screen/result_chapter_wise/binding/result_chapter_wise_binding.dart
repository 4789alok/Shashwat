import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/result_chapter_wise/controller/result_chapter_wise_controller.dart';

class ResultChapterWiseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<ResultChapterWiseController>(
        () => ResultChapterWiseController());
  }
}
