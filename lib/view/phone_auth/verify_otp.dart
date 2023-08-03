// ignore_for_file: must_be_immutable

import 'package:all_login_firebase/Navigation/Navigation_Name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatefulWidget {
  String? id;

  OTPScreen({super.key, this.id});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController txtotp = TextEditingController();
  bool load = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextField(
              controller: txtotp,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter OTP"),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  load = true;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.id!,
                    smsCode: txtotp.text.toString());

                try {
                  await auth.signInWithCredential(credential);
                  Get.offNamed(NavigationName.Homepage);
                } catch (e) {
                  setState(() {
                    load = false;
                  });
                }
              },
              child: const Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
