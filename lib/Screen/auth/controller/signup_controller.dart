import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';

class SignupController extends GetxController {
  late TextEditingController emailController,
      passwordController,
      nameController,
      mobileController,
      conPassController,
      dobController;
  late Repo _repo;
  var flag = false.obs;
  var email = '';
  var pass = '';
  var name = '';
  var phone = '';
  var dob = '';
  var gender = '';
  var confirmPass = '';
  RxBool isLoading = false.obs;
  SignupController() {
    _repo = Get.find<RepoImpl>();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    conPassController = TextEditingController();
    dobController = TextEditingController();
  }

  hitSignupApi(BuildContext context) async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.hitRegisterApi(name, email, pass);
      if (result != null) {
        if (result.status == 200) {
          box.write('isLogedIn', true);
          box.write('id', result.user!.id);
          box.write('name', result.user!.name);
          box.write('email', result.user!.email);
          Get.offAllNamed('/studentDetails');
        } else if (result.status == 201) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              result.msg,
              style: const TextStyle(color: Colors.white),
            ),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              result.msg,
              style: const TextStyle(color: Colors.white),
            ),
          ));
        }
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please Enter name";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return "Please Enter valid name";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Please Enter valid mobile no.";
    }
    return null;
  }

  String? validateDob(String value) {
    if (value.isEmpty) {
      return "Please select Dob";
    }
    return null;
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

  String? validateconfirmPassword(String value) {
    if (value != passwordController.text) {
      return "Password not match";
    }
    return null;
  }
}

// Future<String> getToken() async {
//   var deviceToken = '';
//   await FirebaseMessaging.instance.getToken().then((token) {
//     deviceToken = token!;
//     return token;
//   });
//   return deviceToken;
// }
