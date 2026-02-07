import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'applicable_regulations_screen.dart';
import 'associated_taxes_screen.dart';
import 'construction_systems_screen.dart';
import 'contract_types_screen.dart';
import 'preliminary_studies_screen.dart';
import 'professional_services_screen.dart';
import 'project_phases_screen.dart';

class OtherResourcesScreen extends StatelessWidget {
  const OtherResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> resources = [
      {'title': 'Fases de un proyecto', 'screen': const ProjectPhasesScreen()},
      {'title': 'Tipos de contratos', 'screen': const ContractTypesScreen()},
      {'title': 'Estudios previos', 'screen': const PreliminaryStudiesScreen()},
      {
        'title': 'Contratación de servicios profesionales',
        'screen': const ProfessionalServicesScreen(),
      },
      {
        'title': 'Sistemas constructivos',
        'screen': const ConstructionSystemsScreen(),
      },
      {'title': 'Impuestos asociados', 'screen': const AssociatedTaxesScreen()},
      {
        'title': 'Reglamentos aplicables',
        'screen': const ApplicableRegulationsScreen(),
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.negroFondo,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text('Otros recursos', style: AppTextStyles.titulo),
                      const SizedBox(height: 25),
                      Container(
                        height: 600,
                        width: 380,
                        padding: const EdgeInsets.symmetric(
                          vertical: 30.0,
                          horizontal: 15.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundCard,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          children: [
                            for (int i = 0; i < resources.length; i++) ...[
                              Expanded(
                                child: _buildResourceButton(
                                  context,
                                  title: resources[i]['title'] as String,
                                  destination: resources[i]['screen'] as Widget,
                                ),
                              ),
                              if (i < resources.length - 1)
                                const SizedBox(height: 15),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildResourceButton(
  BuildContext context, {
  required String title,
  required Widget destination,
}) {
  return Material(
    color: AppColors.azul1,
    borderRadius: BorderRadius.circular(50),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.azul2, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(title, style: AppTextStyles.listTileTitle)),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    ),
  );
}
