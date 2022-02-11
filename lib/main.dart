import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stack_answers_lite/app/config/firebase.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  FirebaseAuth.init(withApiKey: FirebaseConfig.apiKey);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
