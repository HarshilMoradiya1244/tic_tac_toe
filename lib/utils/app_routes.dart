import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screen/game/ai_screen.dart';
import 'package:tic_tac_toe/screen/game/multi_payer.dart';
import 'package:tic_tac_toe/screen/home/view/home_screen.dart';
import 'package:tic_tac_toe/screen/splash/splash_screen.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'game': (context) => const AiScreen(),
  'multiPlayer': (context) => const MultiPlayerScreen(),
};
