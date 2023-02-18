import 'package:get/get.dart';

class DeshboardController extends GetxController {
  var tabIndex = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // if (themePrefrence.read('Muted') != null) {
    //   themeController.muted.value = themePrefrence.read('Muted');
    // }
    // if (themePrefrence.read('DarkMuted') != null) {
    //   themeController.darkMuted.value = themePrefrence.read('DarkMuted');
    // }
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
