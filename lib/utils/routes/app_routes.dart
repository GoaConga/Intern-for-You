import 'package:get/get.dart';
import 'package:internsforyou/screens/intro/views/guest_view.dart';
import 'package:internsforyou/screens/intro/views/selection_view.dart';
import 'package:internsforyou/screens/register/binding.dart';
import 'package:internsforyou/screens/register/views/details_view.dart';
import 'package:internsforyou/screens/register/views/signup_view.dart';

import '../../screens/intro/binding.dart';
import '../../screens/intro/views/intro_view.dart';
import '../../screens/login/binding.dart';
import '../../screens/login/view.dart';
import 'package:internsforyou/setup/setup_main.dart';
import 'package:internsforyou/setup/guide/guide_main.dart';

class AppRoutes {
  static String detailsFormScreen = '/details';
  static String loginScreen = '/login';
  static String registerScreen = '/register';
  static String introGuestScreen = '/intro/2';
  static String introSelectionScreen = '/intro/1';
  static String introScreen = '/intro';

  static List<GetPage> pages = [
    GetPage(
        name: introScreen,
        page: () => const IntroScreen(),
        binding: IntroBinding()),
    GetPage(
        name: introSelectionScreen,
        page: () => const SelectionScreen(),
        binding: IntroBinding()),
    GetPage(
        name: introGuestScreen,
        page: () => const GuestViewScreen(),
        binding: IntroBinding()),
    GetPage(
        name: registerScreen,
        page: () => Guide_MyApp(),
        binding: RegisterBinding()),
    GetPage(
        name: detailsFormScreen,
        page: () => const UserDetailsScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
  ];
}
