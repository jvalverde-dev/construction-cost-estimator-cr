import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreliminaryStudiesScreen extends StatelessWidget {
  const PreliminaryStudiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 40, bottom: 100),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    'Estudios previos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '3 estudios necesarios',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStudyItem(
                      title: 'Estudio topográfico',
                      description:
                          'Define forma, niveles, pendientes y curvas de nivel del terreno.\n\nNecesario para el diseño arquitectónico y estructural.',
                      iconPath: 'assets/icons/Target.svg',
                    ),
                    const SizedBox(height: 40),
                    _buildStudyItem(
                      title: 'Estudio geotécnico',
                      description:
                          'Determina la capacidad portante, tipo de suelo, nivel freático y recomendaciones de cimentación.\n\nObligatorio para edificaciones nuevas según CFIA.',
                      iconPath: 'assets/icons/Layers.svg',
                    ),
                    const SizedBox(height: 40),
                    _buildStudyItem(
                      title: 'Prueba de infiltración',
                      description:
                          'Evalúa la capacidad del suelo para absorber agua.\n\nNecesario para definir el drenaje en sistemas sanitarios de tratamiento individual como los Tanques Sépticos.',
                      iconPath: 'assets/icons/Wind.svg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: SizedBox(
          width: 56,
          height: 56,
          child: FloatingActionButton(
            onPressed: () => Navigator.of(context).pop(),
            backgroundColor: const Color(0xFF9BAEBF).withValues(alpha: 0.8),
            elevation: 0,
            shape: const CircleBorder(),
            child: const Icon(Icons.close, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }

  Widget _buildStudyItem({
    required String title,
    required String description,
    required String iconPath,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: SvgPicture.asset(
            iconPath,
            width: 40,
            height: 40,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF9BAEBF),
                  fontSize: 13,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
