import 'package:flutter/material.dart';

import '../data/typology_content.dart';
import '../models/data_models.dart';

class TypologyDetailsScreen extends StatelessWidget {
  final Typology typology;
  final String materialName;

  const TypologyDetailsScreen({
    super.key,
    required this.typology,
    required this.materialName,
  });

  @override
  Widget build(BuildContext context) {
    final content =
        typologyData[typology.id] ??
        const TypologyContent(
          estructura: 'Información no disponible',
          paredes: 'Información no disponible',
          cubierta: 'Información no disponible',
          cielos: 'Información no disponible',
          entrepisos: 'Información no disponible',
          pisos: 'Información no disponible',
        );

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Clasificación',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              color: const Color(0xFFB0BEC5),
              child: Text(
                '$materialName - Tipo ${typology.id}',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF546E7A),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionItem('Estructura', content.estructura),
                          const SizedBox(height: 30),
                          _buildSectionItem('Cubierta', content.cubierta),
                          const SizedBox(height: 30),
                          _buildSectionItem('Entrepisos', content.entrepisos),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionItem('Paredes', content.paredes),
                          const SizedBox(height: 30),
                          _buildSectionItem('Cielos', content.cielos),
                          const SizedBox(height: 30),
                          _buildSectionItem('Pisos', content.pisos),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            onPressed: () => Navigator.of(context).pop(),
            backgroundColor: const Color(0xFF90A4AE).withValues(alpha: 0.8),
            elevation: 0,
            shape: const CircleBorder(),
            child: const Icon(Icons.close, color: Colors.white, size: 28),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionItem(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 11,
            height: 1.4,
            color: Color(0xFFCFD8DC),
          ),
        ),
      ],
    );
  }
}
