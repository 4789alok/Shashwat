import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';

class StudentDetailsController extends GetxController {
  late TextEditingController standardController,
      schoolNameController,
      nameController,
      mobileController,
      percentController,
      hobbieController,
      addressController,
      pincodeController,
      dobController;
  late Repo _repo;
  var flag = false.obs;
  var standard = '';
  var schoolName = '';
  var name = '';
  var phone = '';
  var dob = '';
  var percentage = '';
  var hobbies = '';
  var address = '';
  var pincode = '';
  RxString response = "".obs;
  RxBool isLoading = false.obs;
  StudentDetailsController() {
    _repo = Get.find<RepoImpl>();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    standardController = TextEditingController();
    schoolNameController = TextEditingController();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    percentController = TextEditingController();
    hobbieController = TextEditingController();
    addressController = TextEditingController();
    pincodeController = TextEditingController();
    dobController = TextEditingController();
    nameController.text = box.read('name');
  }

  hitStudentDetailsApi() async {
    // var token = await getToken();
    isLoading.toggle();
    print('start');
    try {
      final result = await _repo.hitRegisterAllDataApi(
          box.read('id').toString(),
          dob,
          standard,
          schoolName,
          percentage,
          hobbies,
          address,
          pincode,
          phone);
      if (result != null) {
        Get.offAllNamed('/dashboard');
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

  String? validateSchoolName(String value) {
    if (value.isEmpty) {
      return "Please Enter school name";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return "Please Enter valid school name";
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

  String? validateStandard(String value) {
    if (value.isEmpty) {
      return "Please enter standard";
    }
    return null;
  }

  String? validatePercent(String value) {
    if (value.isEmpty) {
      return "Please enter your percentage";
    } else if (int.parse(value) < 0 || int.parse(value) > 100) {
      return "Please enter valid percentage";
    }
    return null;
  }

  String? validateHobbies(String value) {
    if (value.isEmpty) {
      return "Please enter hobbie";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Please enter address";
    }
    return null;
  }

  String? validatePincode(String value) {
    if (value.isEmpty) {
      return "Please enter pincode";
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
