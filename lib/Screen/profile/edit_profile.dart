import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shashwat/Core/model/popup_response.dart';
import 'package:shashwat/Screen/auth/table_date_picker.dart';
import 'package:shashwat/Screen/profile/controller/profile_controller.dart';
import 'package:shashwat/Widget/popup_model_bottomsheet.dart';
import 'package:shashwat/constant/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  DateTime _selectedDate = DateTime.now();
  final controller = Get.find<ProfileController>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  get datePicked => _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF033d73),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("./images/backin.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          SingleChildScrollView(
              child: Form(
            key: loginFormKey,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  // height: 400,
                  // width:MediaQuery.of(context).size.width-20,
                  //  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Full Name",
                              labelStyle: const TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: Color(0xFF033d73),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFff8000),
                                  )),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFF033d73),
                                  ))),
                          keyboardType: TextInputType.name,
                          controller: controller.nameController,
                          onSaved: (value) {
                            controller.name.value = value!;
                          },
                          validator: (value) {
                            return controller.validateName(value!);
                          },
                        ),
                      ),
                      // const SizedBox(
                      //   height: 04,
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                // width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      onTap: () {
                                        setState(() {
                                          // _selectDate(context);
                                          _presentDatePicker();
                                          // getDateShow(context, dateController);
                                        });
                                      },

                                      readOnly: true,
                                      //cursorWidth: 2,
                                      decoration: InputDecoration(
                                          hintText: (datePicked.toString()),
                                          labelText: "Date Of Birth",
                                          labelStyle: const TextStyle(
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF033d73),
                                              fontSize: 14),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFff8000),
                                              )),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF033d73),
                                                  ))),
                                      keyboardType: TextInputType.name,
                                      controller: controller.dobController,
                                      onSaved: (value) {
                                        controller.dob.value = value!;
                                      },
                                      validator: (value) {
                                        return controller.validateDob(value!);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () => _showPopUp(
                                      context: context,
                                      title: 'Select Standard',
                                      data: standard,
                                      fieldAddress: 'standard'),
                                  decoration: InputDecoration(
                                      labelText: "Select Standard",
                                      suffixIcon: const Icon(
                                          Icons.arrow_drop_down_rounded),
                                      labelStyle: const TextStyle(
                                          fontFamily: "Times New Roman",
                                          color: Color(0xFF033d73),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color(0xFFff8000),
                                          )),
                                      focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: Color(0xFF033d73),
                                          ))),
                                  keyboardType: TextInputType.number,
                                  controller: controller.standardController,
                                  onSaved: (value) {
                                    controller.standard.value = value!;
                                  },
                                  validator: (value) {
                                    return controller.validateStandard(value!);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "School Name",
                              labelStyle: const TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: Color(0xFF033d73),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFff8000),
                                  )),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFF033d73),
                                  ))),
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.schoolNameController,
                          onSaved: (value) {
                            controller.schoolName.value = value!;
                          },
                          validator: (value) {
                            return controller.validateSchoolName(value!);
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          maxLength: 3,
                          decoration: InputDecoration(
                              counterText: "",
                              labelText: "Recent Percentage",
                              labelStyle: const TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: Color(0xFF033d73),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFff8000),
                                  )),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFF033d73),
                                  ))),
                          keyboardType: TextInputType.number,
                          controller: controller.percentController,
                          onSaved: (value) {
                            controller.percentage.value = value!;
                          },
                          validator: (value) {
                            return controller.validatePercent(value!);
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Hobbies",
                              labelStyle: const TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: Color(0xFF033d73),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFff8000),
                                  )),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFF033d73),
                                  ))),
                          keyboardType: TextInputType.name,
                          controller: controller.hobbieController,
                          onSaved: (value) {
                            controller.hobbies.value = value!;
                          },
                          validator: (value) {
                            return controller.validateHobbies(value!);
                          },
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Address",
                              labelStyle: const TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: Color(0xFF033d73),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFff8000),
                                  )),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFF033d73),
                                  ))),
                          keyboardType: TextInputType.name,
                          controller: controller.addressController,
                          onSaved: (value) {
                            controller.address.value = value!;
                          },
                          validator: (value) {
                            return controller.validateAddress(value!);
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                // width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                child: TextFormField(
                                  //cursorWidth: 2,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                      counterText: "",
                                      labelText: "Contact Number",
                                      labelStyle: const TextStyle(
                                          fontFamily: "Times New Roman",
                                          color: Color(0xFF033d73),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color(0xFFff8000),
                                          )),
                                      focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: Color(0xFF033d73),
                                          ))),
                                  keyboardType: TextInputType.number,
                                  controller: controller.mobileController,
                                  onSaved: (value) {
                                    controller.phone.value = value!;
                                  },
                                  validator: (value) {
                                    return controller.validatePhone(value!);
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                child: TextFormField(
                                  //cursorWidth: 2,
                                  maxLength: 6,

                                  decoration: InputDecoration(
                                      counterText: "",
                                      labelText: "Pin Code",
                                      labelStyle: const TextStyle(
                                          fontFamily: "Times New Roman",
                                          color: Color(0xFF033d73),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color(0xFFff8000),
                                          )),
                                      focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: Color(0xFF033d73),
                                          ))),
                                  keyboardType: TextInputType.number,
                                  controller: controller.pincodeController,
                                  onSaved: (value) {
                                    controller.pincode.value = value!;
                                  },
                                  validator: (value) {
                                    return controller.validatePincode(value!);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  return controller.isLoading.isTrue
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              color: Colors.amber,
                            )
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            final isValid =
                                loginFormKey.currentState!.validate();
                            if (!isValid) {
                              return;
                            }
                            loginFormKey.currentState!.save();
                            controller.hitEditProfileApi();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 26),
                            decoration: const BoxDecoration(
                              color: Color(0xFF033d73),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              "Update",
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        );
                }),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _showPopUp(
      {required BuildContext context,
      required String title,
      required List<String> data,
      required String fieldAddress}) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: PopupModelBottomSheet(
                title: title,
                data: data,
                response: _getResponse,
                fieldAddress: fieldAddress,
              ));
        });
  }

  void _getResponse(String response, String fieldAddress) {
    final newResponse =
        PopUpResponse(response: response, address: fieldAddress);
    print("response back: ${newResponse.response}");

    if (newResponse.address.toString() == "standard") {
      controller.standardController.text = newResponse.response;
    }
    controller.response.value = newResponse.response;

    // setState(() {
    //   respo = newResponse.response.toString();
    // });
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF033d73),
            ),
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        controller.dobController.text =
            DateFormat(('MM/dd/yyyy')).format(_selectedDate);
      });
    });
  }

  // void getTableDatePicker() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: TableDatePicker(
  //           dateController: controller.dobController,
  //         ),
  //       );
  //     },
  //   );
  // }
}
