import 'dart:async';
import 'package:all_login_firebase/Navigation/Navigation_Name.dart';
import 'package:all_login_firebase/firebase_class/firebaseclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  bool msg = false;
  @override
  void initState() {
    super.initState();
    msg = checkData();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      msg
          ? Get.offNamed(NavigationName.Homepage)
          : Get.offNamed(NavigationName.Login);
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.network(
              "https://miro.medium.com/max/900/1*ADxa8DAu2pT66Nv3roRsvA.gif",
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
