import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';

class ForgetPassController extends GetxController {
  dynamic argumentData = Get.arguments;
  late TextEditingController otpController,
      passController,
      confirmPassController;

  late Repo _repo;
  var otp = '';
  var pass = '';
  var confirmPass = '';
  var sendOtp = '';
  var mail = '';
  RxBool isLoading = false.obs;

  ForgetPassController() {
    _repo = Get.find<RepoImpl>();
  }

  @override
  void onInit() {
    super.onInit();
    mail = argumentData[0]['mail'];
    sendOtp = argumentData[1]['otp'];
    otpController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  String? validateOTP(String value) {
    if (value != sendOtp) {
      return "otp not match";
    }
    return null;
  }

  String? validatePass(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  String? validateconfirmPass(String value) {
    if (value != passController.text) {
      return "Password not match";
    }
    return null;
  }

  // void hitResetPass(String mail, String pass, String confirmPass) async {
  //   isLoading.toggle();
  //   final result = await _repo.hitForgetPasswordApi(mail, pass, confirmPass);

  //   if (result != null) {
  //     print(result);

  //     if (result.status == 200) {
  //       Get.snackbar(mail, result.msg,
  //           colorText: Colors.black,
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.white.withOpacity(0.5),
  //           margin: const EdgeInsets.all(10));
  //       Get.offNamed('/signIn');
  //     } else if (result.status == 201) {
  //       Get.snackbar(mail, '${result.msg}',
  //           colorText: Colors.black,
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.white.withOpacity(0.5),
  //           margin: const EdgeInsets.all(10));
  //     } else if (result.status == 400) {
  //       Get.snackbar(mail, '${result.msg}',
  //           colorText: Colors.black,
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.white.withOpacity(0.5),
  //           margin: const EdgeInsets.all(10));
  //     } else {
  //       Get.snackbar(mail, '${result.msg}',
  //           colorText: Colors.black,
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.white.withOpacity(0.5),
  //           margin: const EdgeInsets.all(10));
  //     }
  //   } else {
  //     print('No data found');
  //   }
  // }

  hitResetBtn() {
    // hitResetPass(mail, pass, confirmPass);
  }
}
