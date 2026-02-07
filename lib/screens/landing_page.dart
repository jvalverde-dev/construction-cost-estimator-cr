import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'main_scaffold.dart';
import 'more_info_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _isSwitchActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.negroFondo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 55.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Información', style: AppTextStyles.titulo),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: [
                    const Text(
                      '"Entiendo que está aplicación es parte de un proyecto académico y que sus resultados son estimaciones de costos para la construcción de vivienda en Costa Rica. No sustituyen un presupuesto formal y no poseen valor legal"',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.pequeno,
                    ),
                    const SizedBox(height: 25.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MoreInfoScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Conocer más de este trabajo',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.pequenoLink,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    const Text(
                      'He leído y estoy de acuerdo con esta \nafirmación',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.pequenoResaltado,
                    ),
                    const SizedBox(height: 15.0),
                    Transform.scale(
                      scale: 1.2,
                      child: Switch(
                        value: _isSwitchActive,
                        onChanged: (newValue) {
                          setState(() {
                            _isSwitchActive = newValue;
                          });
                        },
                        activeColor: AppColors.switchThumb,
                        activeTrackColor: AppColors.azul1,
                        inactiveThumbColor: AppColors.switchThumb,
                        inactiveTrackColor: AppColors.switchBackgroundInactive,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    ElevatedButton(
                      onPressed:
                          _isSwitchActive
                              ? () {
                                Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) => const MainScaffold(),
                                    transitionsBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                    transitionDuration: const Duration(
                                      milliseconds: 500,
                                    ),
                                  ),
                                );
                              }
                              : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: AppColors.azul1,
                        disabledBackgroundColor: AppColors.grisSecundario,
                        foregroundColor: AppColors.blanco,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      child: const Text(
                        'Continuar',
                        style: AppTextStyles.subtitulo,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 3),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
