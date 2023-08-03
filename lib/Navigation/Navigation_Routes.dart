import 'package:all_login_firebase/Navigation/Navigation_Name.dart';
import 'package:all_login_firebase/view/home_page.dart';
import 'package:all_login_firebase/view/login.dart';
import 'package:all_login_firebase/view/phone_auth/login_phone_number.dart';
import 'package:all_login_firebase/view/phone_auth/verify_otp.dart';
import 'package:all_login_firebase/view/sign_up.dart';
import 'package:all_login_firebase/view/splash_screen.dart';
import 'package:get/get.dart';

class NavigationRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: NavigationName.SpleshScreen,
      page: () => const SpleshScreen(),
    ),
    GetPage(
      name: NavigationName.Homepage,
      page: () => const Homepage(),
    ),
    GetPage(
      name: NavigationName.SignUp,
      page: () => const SignUp(),
    ),
    GetPage(
      name: NavigationName.Login,
      page: () => const Login(),
    ),
    GetPage(
      name: NavigationName.OTPScreen,
      page: () => OTPScreen(),
    ),
    GetPage(
      name: NavigationName.LoginPhone,
      page: () => const LoginPhone(),
    ),
  ];
}
