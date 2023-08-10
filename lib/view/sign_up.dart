import 'package:all_login_firebase/Navigation/Navigation_Name.dart';
import 'package:all_login_firebase/firebase_class/firebaseclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtemail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Email"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtpassword,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Password"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                String user = await signUp(txtemail.text, txtpassword.text);
                if (user == "SignUp Successfully") {
                  Get.toNamed(NavigationName.Login);
                }
                Get.snackbar("SignUp", user);
              },
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.toNamed(NavigationName.Login);
              },
              child: const Text(
                "Already have an account! Log In",
                style: TextStyle(color: Color(0xff458fef)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
