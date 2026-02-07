import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.negroFondo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 3),
              const Text(
                'Sobre este proyecto',
                textAlign: TextAlign.center,
                style: AppTextStyles.titulo,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text.rich(
                  TextSpan(
                    style: AppTextStyles.pequeno,
                    children: const <TextSpan>[
                      TextSpan(
                        text:
                            'Esta aplicación es el producto principal del Trabajo Final de Graduación denominado “',
                      ),
                      TextSpan(
                        text:
                            'Diseño y desarrollo de una aplicación móvil basada en Flutter para estimar el costo de construcción de vivienda en Costa Rica, caso de estudio aplicado al cantón de Coto Brus para el período 2023-2024',
                        style: AppTextStyles.pequenoItalic,
                      ),
                      TextSpan(
                        text:
                            '” para optar por el grado de Licenciatura en Ingeniería Civil de la Universidad de Costa Rica.',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(flex: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.blanco),
                    iconSize: 24,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.azul2,
                      fixedSize: const Size(40, 40),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
