import 'package:all_login_firebase/view/phone_auth/verify_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({super.key});

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  TextEditingController txtphone = TextEditingController();
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
              controller: txtphone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Phone Number"),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  load = true;
                });
                await auth.verifyPhoneNumber(
                  phoneNumber: txtphone.text,
                  verificationCompleted: (_) {},
                  verificationFailed: (e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return OTPScreen(
                          id: verificationId,
                        );
                      },
                    ));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              },
              child: const Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
