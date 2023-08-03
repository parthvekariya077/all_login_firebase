// ignore_for_file: avoid_print

import 'package:all_login_firebase/Navigation/Navigation_Name.dart';
import 'package:all_login_firebase/firebase_class/firebaseclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logOut();
              Get.offNamed(NavigationName.Login);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
