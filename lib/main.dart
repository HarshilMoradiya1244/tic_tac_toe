import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/utils/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  );
}