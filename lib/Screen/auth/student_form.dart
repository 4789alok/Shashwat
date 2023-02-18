import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashwat/Core/model/popup_response.dart';
import 'package:shashwat/Screen/auth/controller/student_details_controller.dart';
import 'package:shashwat/Screen/dashboard/dashboard.dart';
import 'package:shashwat/Screen/auth/table_date_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:shashwat/Widget/popup_model_bottomsheet.dart';
import 'package:shashwat/constant/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  DateTime _selectedDate = DateTime.now();
  // TextEditingController dateController = TextEditingController();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final controller = Get.find<StudentDetailsController>();

  get datePicked => _selectedDate;

  // DateTime _date = DateTime.now();

  // Future<Null> _selectDate(BuildContext context) async {
  //   DateTime? _datePicker = await showDatePicker(
  //       context: context,
  //       initialDate: _date,
  //       firstDate: DateTime(1947),
  //       lastDate: DateTime(2030),
  //       initialDatePickerMode: DatePickerMode.year);

  //   if (_datePicker != null && _datePicker != _date) {
  //     setState(() {
  //       _date = _datePicker;
  //       print(_date.toString());
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF033d73),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Student Details",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        // leading: IconButton(
        //   onPressed: (() {
        //     Navigator.of(context).pushReplacement(
        //       MaterialPageRoute(builder: (context) => const Sign_in()),
        //     );
        //   }),
        //   icon: Icon(Icons.arrow_back_ios),
        //   color: Colors.blue,
        // ),
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
                    fit: BoxFit.cover),
              ),
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
                              controller.name = value!;
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
                                                            Radius.circular(
                                                                10)),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFF033d73),
                                                    ))),
                                        keyboardType: TextInputType.name,
                                        controller: controller.dobController,
                                        onSaved: (value) {
                                          controller.dob = value!;
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
                                      controller.standard = value!;
                                    },
                                    validator: (value) {
                                      return controller
                                          .validateStandard(value!);
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
                              controller.schoolName = value!;
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
                                counterText: '',
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
                              controller.percentage = value!;
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
                              controller.hobbies = value!;
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
                              controller.address = value!;
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
                                            fontWeight: FontWeight.w900,
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
                                      controller.phone = value!;
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
                                      controller.pincode = value!;
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
                              controller.hitStudentDetailsApi();
                            },
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xFF033d73),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: const Text(
                                "Submit",
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
            ),
          ),
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
        }).then((pickedDate) {
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

void getDateShow(
    BuildContext context, TextEditingController dateController) async {
  var datePicked = await DatePicker.showSimpleDatePicker(
    context,
    initialDate: DateTime(1994),
    firstDate: DateTime(1960),
    lastDate: DateTime(2030),
    dateFormat: 'MMMM-dd-yyyy',
    textColor: const Color(0xFF033d73),
    locale: DateTimePickerLocale.en_us,
    // pickerMode: DateTimePickerMode.datetime
    looping: true,
  );
  dateController.text = DateFormat(('MM/dd/yyyy')).format(datePicked!);

  final snackBar = SnackBar(content: Text("Date Picked $datePicked"));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  print("abc" + datePicked.toString());
}
