import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/Screen/chapters/controller/chapter_controller.dart';

class ChapterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.lazyPut<SelectChapterController>(() => SelectChapterController());
  }
}
