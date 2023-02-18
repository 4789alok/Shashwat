import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;
  late Repo _repo;
  var flag = false.obs;
  var email = '';
  var pass = '';
  RxBool isLoading = false.obs;
  LoginController() {
    _repo = Get.find<RepoImpl>();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  hitLoginApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.hitLoginApi(email, pass);
      if (result != null) {
        if (result.status == 200) {
          box.write('isLogedIn', true);
          box.write('id', result.user!.id);
          box.write('name', result.user!.name);
          box.write('email', result.user!.email);
          Get.offAllNamed('/dashboard');
        } else if (result.status == 201) {
          Fluttertoast.showToast(msg: result.msg);
        } else if (result.status == 400) {
          Fluttertoast.showToast(msg: result.msg);
        } else {
          Fluttertoast.showToast(msg: result.msg);
        }
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  // Future<String> getToken() async {
  //   var deviceToken = '';
  //   await FirebaseMessaging.instance.getToken().then((token) {
  //     deviceToken = token!;
  //     return token;
  //   });
  //   return deviceToken;
  // }
}
