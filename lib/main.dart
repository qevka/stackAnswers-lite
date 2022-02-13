import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:stack_answers_lite/app/config/firebase.dart';

import 'app/routes/app_pages.dart';

// todo save auth credentials to disk and reload them when logging in so user login can persist..
// refresh auth token.
// GetStorage box = GetStorage();
// box.write('credentials', jsonEncode(authResponse.toJson()));

void main() async {
  await GetStorage.init();
  FirebaseAuth.init(withApiKey: FirebaseConfig.apiKey, client: http.Client());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
