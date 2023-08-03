import 'package:all_login_firebase/firebase_class/firebaseclass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import '../Navigation/Navigation_Name.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  Future<void> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print('User: ${userCredential.user}');
      } else if (result.status == LoginStatus.cancelled) {
        print('Login cancelled by user');
      } else {
        print('Facebook login failed');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: txtemail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Email"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtpassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String user = await login(txtemail.text, txtpassword.text);
                    Get.snackbar('Login', user);
                    if (user == 'Login Successfully') {
                      Get.offNamed(NavigationName.Homepage);
                    }
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(NavigationName.SignUp);
                  },
                  child: const Text(
                    "Don't have an account ? Sign up",
                    style: TextStyle(color: Color(0xff458fef)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    bool user = await googleSign();
                    if (user) {
                      Get.offNamed(NavigationName.Homepage);
                    }
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Image.asset('assets/images/google_logo.png'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(NavigationName.LoginPhone);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: const Color(0xff000000))),
                    child: const Text(
                      'Login with phone',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    loginWithFacebook();
                  },
                  child: const Text("FB Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
