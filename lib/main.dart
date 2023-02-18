import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shashwat/Screen/Result/binding/result_binding.dart';
import 'package:shashwat/Screen/Result/tab_bar.dart';
import 'package:shashwat/Screen/auth/binding/signin_binding.dart';
import 'package:shashwat/Screen/auth/binding/signup_binding.dart';
import 'package:shashwat/Screen/auth/binding/student_details_binding.dart';
import 'package:shashwat/Screen/auth/sign_in.dart';
import 'package:shashwat/Screen/auth/sign_up.dart';
import 'package:shashwat/Screen/auth/student_form.dart';
import 'package:shashwat/Screen/auth/welcome_page.dart';
import 'package:shashwat/Screen/chapters/binding/chapter_binding.dart';
import 'package:shashwat/Screen/chapters/select_chapter.dart';
import 'package:shashwat/Screen/dashboard/binding/dashboard_binding.dart';
import 'package:shashwat/Screen/dashboard/dashboard.dart';
import 'package:shashwat/Screen/home/binding/home_binding.dart';
import 'package:shashwat/Screen/home/home.dart';
import 'package:shashwat/Screen/medium/binding/select_medium_binding.dart';
import 'package:shashwat/Screen/medium/select_medium.dart';
import 'package:shashwat/Screen/privacy_policy/privacy_policy.dart';
import 'package:shashwat/Screen/profile/binding/profile_binding.dart';
import 'package:shashwat/Screen/profile/edit_Profile.dart';
import 'package:shashwat/Screen/profile/profile.dart';
import 'package:shashwat/Screen/result_chapter_wise/binding/result_chapter_wise_binding.dart';
import 'package:shashwat/Screen/result_chapter_wise/select_chapterr.dart';
import 'package:shashwat/Screen/result_date_wise/binding/result_date_wise_binding.dart';
import 'package:shashwat/Screen/result_date_wise/result_date_wise.dart';
import 'package:shashwat/Screen/result_subject_wise/binding/select_result_subject_wise_binding.dart';
import 'package:shashwat/Screen/result_subject_wise/select_subjectr.dart';
import 'package:shashwat/Screen/result_test_wise/binding/result_test_wise_binding.dart';
import 'package:shashwat/Screen/result_test_wise/select_test_wise.dart';
import 'package:shashwat/Screen/splash_screen/splash_screen.dart';
import 'package:shashwat/Screen/standerd/binding/select_standerd_binding.dart';
import 'package:shashwat/Screen/standerd/select_standard.dart';
import 'package:shashwat/Screen/subjects/binding/select_subject_binding.dart';
import 'package:shashwat/Screen/subjects/select_subject.dart';
import 'package:shashwat/Screen/tests/binding/question_binding.dart';
import 'package:shashwat/Screen/tests/binding/test_binding.dart';
import 'package:shashwat/Screen/tests/question_answer.dart';
import 'package:shashwat/Screen/tests/test_instruction.dart';
import 'package:shashwat/Screen/tests/test_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      )),
      getPages: [
        GetPage(
          name: '/dashboard',
          page: () => const Dashboard(),
          binding: DeshboardBinding(),
        ),
        GetPage(
          name: '/signIn',
          page: () => const SignIn(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signUp',
          page: () => const Sign_up(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: '/profile',
          page: () => Profile(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => Home(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/editProfile',
          page: () => const EditProfile(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: '/studentDetails',
          page: () => const StudentDetails(),
          binding: StudentDetailsBinding(),
        ),
        GetPage(
          name: '/medium',
          page: () => Medium(),
          binding: MediumBinding(),
        ),
        GetPage(
          name: '/standerd',
          page: () => const SelectStandard(),
          binding: StanderdBinding(),
        ),
        GetPage(
          name: '/subject',
          page: () => const SelectSubject(),
          binding: SubjectBinding(),
        ),
        GetPage(
          name: '/chapter',
          page: () => const SelectChapter(),
          binding: ChapterBinding(),
        ),
        GetPage(
          name: '/testList',
          page: () => const TestList(),
          binding: TestBinding(),
        ),
        GetPage(
          name: '/testIntroduction',
          page: () => const Test_Instruction(),
          // binding: TestBinding(),
        ),
        GetPage(
          name: '/questionAnswer',
          page: () => const QuestionAnswer(),
          binding: QuestionBinding(),
        ),
        GetPage(
          name: '/resultSubjectWise',
          page: () => ResultSubjectWise(),
          binding: ResultSubjectWiseBinding(),
        ),
        GetPage(
          name: '/resultDateWise',
          page: () => const ResultDateWise(),
          binding: ResultDateWiseBinding(),
        ),
        GetPage(
          name: '/resultchapterWise',
          page: () => const ResultChapterWise(),
          binding: ResultChapterWiseBinding(),
        ),
        GetPage(
          name: '/resultTestWise',
          page: () => const ResultTestWise(),
          binding: ResultTestWiseBinding(),
        ),
        GetPage(
          name: '/result',
          page: () => const OverView(),
          binding: ResultBinding(),
        ),
        GetPage(
          name: '/welcomePage',
          page: () => const Welcome_page(),
          // binding: LoginBinding(),
        ),
        GetPage(
          name: '/privacy',
          page: () => const PrivacyPolice(),
          // binding: LoginBinding(),
        ),
        GetPage(
          name: '/splashScreen',
          page: () => const SplashScreen(),
          // binding: LoginBinding(),
        ),
        // GetPage(
        //   name: '/downloadPage',
        //   page: () => const PdfDownload(),
        //   // binding: LoginBinding(),
        // ),
      ],
      initialRoute: '/splashScreen',
    );
  }
}
