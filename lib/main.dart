import 'package:all_login_firebase/Navigation/Navigation_Name.dart';
import 'package:all_login_firebase/Navigation/Navigation_Routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyBQET-Y2gDeshJqrNWr5KH1XIoo_xIG0fw',
        appId: '1:778677281125:android:e498837dd9e08bc31a818c',
        messagingSenderId: '778677281125',
        projectId: 'all-login-firebase'),
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: NavigationRoute.pages,
      initialRoute: NavigationName.SpleshScreen,
    ),
  );
}
