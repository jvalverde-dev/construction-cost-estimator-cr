import 'dart:async';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.negroFondo,
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo_estaca.png'),
          width: 200,
        ),
      ),
    );
  }
}
