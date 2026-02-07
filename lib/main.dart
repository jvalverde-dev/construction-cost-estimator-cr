import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'services/project_service.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProjectService.instance.loadProjects();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estimador de Costos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.negroFondo,
      ),
      home: const SplashScreen(),
    );
  }
}
