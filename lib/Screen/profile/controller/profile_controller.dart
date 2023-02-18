import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Core/repository/repo.dart';
import 'package:shashwat/Core/repository/repo_impl.dart';
import 'package:shashwat/constant/constants.dart';

class ProfileController extends GetxController {
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
  RxBool isLoading = false.obs;
  RxString response = "".obs;
  var standard = ''.obs;
  var schoolName = ''.obs;
  var name = ''.obs;
  var phone = ''.obs;
  var dob = ''.obs;
  var percentage = ''.obs;
  var hobbies = ''.obs;
  var address = ''.obs;
  var pincode = ''.obs;

  ProfileController() {
    _repo = Get.find<RepoImpl>();
    hitProfileApi();
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
    nameController.text = box.read('name').toString();
    name.value = box.read('name').toString();
  }

  hitProfileApi() async {
    isLoading.toggle();
    try {
      final result = await _repo.getProfileApi(box.read('id').toString());
      if (result != null) {
        dob.value = result.user!.dob.toString() == "null"
            ? ""
            : result.user!.dob.toString();
        standard.value = result.user!.standard.toString() == "null"
            ? ""
            : result.user!.standard.toString();
        schoolName.value = result.user!.school_name.toString() == "null"
            ? ""
            : result.user!.school_name.toString();
        percentage.value = result.user!.recent_percentage.toString() == "null"
            ? ""
            : result.user!.recent_percentage.toString();
        hobbies.value = result.user!.hobbies!.toString() == "null"
            ? ""
            : result.user!.hobbies.toString();
        address.value = result.user!.address.toString() == "null"
            ? ""
            : result.user!.address.toString();
        pincode.value = result.user!.pin_code.toString() == "null"
            ? ""
            : result.user!.pin_code.toString();
        name.value = result.user!.name.toString() == "null"
            ? ""
            : result.user!.name.toString();
        phone.value = result.user!.mobile.toString() == "null"
            ? ""
            : result.user!.mobile.toString();

        standardController.text = result.user!.standard.toString();
        schoolNameController.text = result.user!.school_name.toString();
        nameController.text = result.user!.name.toString();
        mobileController.text = result.user!.mobile.toString();
        percentController.text = result.user!.recent_percentage.toString();
        hobbieController.text = result.user!.hobbies.toString();
        addressController.text = result.user!.address.toString();
        pincodeController.text = result.user!.pin_code.toString();
        dobController.text = result.user!.dob.toString();
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading.toggle();
    }
  }

  hitEditProfileApi() async {
    isLoading.toggle();
    try {
      final result = await _repo.hitEditProfileApi(
          box.read('id').toString(),
          dob.value,
          standard.value,
          schoolName.value,
          percentage.value,
          hobbies.value,
          address.value,
          pincode.value,
          name.value,
          phone.value);
      if (result != null) {
        box.write('name', result.user!.name);
        dob.value = result.user!.dob.toString();
        standard.value = result.user!.standard.toString();
        schoolName.value = result.user!.school_name.toString();
        percentage.value = result.user!.recent_percentage.toString();
        hobbies.value = result.user!.hobbies!;
        address.value = result.user!.address.toString();
        pincode.value = result.user!.pin_code.toString();
        name.value = result.user!.name.toString();

        Get.back();
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
