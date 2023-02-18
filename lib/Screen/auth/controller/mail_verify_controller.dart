import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';

class MailVerifyController extends GetxController {
  late TextEditingController emailController;
  late Repo _repo;
  var mail = '';
  var otp = '';
  RxBool isLoading = false.obs;

  MailVerifyController() {
    _repo = Get.find<RepoImpl>();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
  }

  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

  // void verifyMail(String mail) async {
  //   isLoading.toggle();
  //   final result = await _repo.hitEmailVerifyApi(mail);

  //   if (result != null) {
  //     print(result);

  //     if (result.status == 200) {
  //       otp = result.otp.otp!;
  //       Get.offNamed('/forgetPass', arguments: [
  //         {'mail': mail},
  //         {'otp': otp},
  //       ]);
  //     } else if (result.status == 201) {
  //       Get.snackbar(emailController.text, '${result.msg}',
  //           colorText: Colors.black,
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.white.withOpacity(0.5),
  //           margin: const EdgeInsets.all(10));
  //     } else if (result.status == 400) {
  //       Get.snackbar(emailController.text, '${result.msg}',
  //           colorText: Colors.black,
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.white.withOpacity(0.5),
  //           margin: const EdgeInsets.all(10));
  //     } else {
  //       Get.snackbar(emailController.text, '${result.msg}',
  //           colorText: Colors.black,
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.white.withOpacity(0.5),
  //           margin: const EdgeInsets.all(10));
  //     }
  //   } else {
  //     print('No data found');
  //   }
  // }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  hitVerifyBtn() {
    // verifyMail(mail);
  }
}
