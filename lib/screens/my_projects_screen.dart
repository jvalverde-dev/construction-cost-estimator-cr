import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/data_models.dart';
import '../services/project_service.dart';
import '../theme/app_theme.dart';
import 'edit_project_screen.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({super.key});

  Future<void> _showDeleteConfirmationDialog(
    BuildContext context,
    Project project,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.negroFondo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppColors.azul2),
          ),
          title: Text(
            'Eliminar Proyecto',
            style: AppTextStyles.titulo.copyWith(fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '¿Estás seguro de que quieres eliminar el proyecto "${project.name}"?',
                  style: AppTextStyles.pequeno,
                ),
                const SizedBox(height: 5),
                Text(
                  'Esta acción no se puede deshacer.',
                  style: AppTextStyles.pequeno.copyWith(color: AppColors.gris),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: AppColors.blanco),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red.withValues(alpha: 0.8),
              ),
              child: const Text(
                'Eliminar',
                style: TextStyle(color: AppColors.blanco),
              ),
              onPressed: () {
                ProjectService.instance.deleteProject(project.id);
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.negroFondo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text('Mis proyectos', style: AppTextStyles.titulo),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundCard,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ValueListenableBuilder<List<Project>>(
                    valueListenable: ProjectService.instance.projectsNotifier,
                    builder: (context, projects, child) {
                      if (projects.isEmpty) {
                        return _buildEmptyState();
                      } else {
                        return _buildProjectsList(context, projects);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        'No hay proyectos guardados',
        textAlign: TextAlign.center,
        style: AppTextStyles.listTileTitle,
      ),
    );
  }

  Widget _buildProjectsList(BuildContext context, List<Project> projects) {
    final currencyFormatter = NumberFormat.currency(
      symbol: '₡',
      decimalDigits: 0,
    );

    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Card(
          color: AppColors.projectCardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(bottom: 15),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.name,
                            style: AppTextStyles.projectCardTitle,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${project.totalArea.toStringAsFixed(0)} m²',
                            style: AppTextStyles.micro.copyWith(
                              color: AppColors.gris,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      EditProjectScreen(project: project),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.azul1,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                        ),
                        child: const Text('Ver', style: AppTextStyles.pequeno),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      currencyFormatter
                          .format(project.totalCost)
                          .replaceAll(',', ' '),
                      style: AppTextStyles.projectCost,
                    ),
                    SizedBox(
                      height: 28,
                      child: ElevatedButton(
                        onPressed:
                            () =>
                                _showDeleteConfirmationDialog(context, project),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.inputDisabled,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                        ),
                        child: const Text(
                          'Eliminar',
                          style: AppTextStyles.pequeno,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
