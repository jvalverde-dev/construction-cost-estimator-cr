import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/data_models.dart';
import '../services/pdf_service.dart';
import '../services/project_service.dart';
import '../theme/app_theme.dart';
import 'main_scaffold.dart';

class EditProjectScreen extends StatefulWidget {
  final Project project;
  const EditProjectScreen({super.key, required this.project});

  @override
  State<EditProjectScreen> createState() => _EditProjectScreenState();
}

class _EditProjectScreenState extends State<EditProjectScreen> {
  late TextEditingController _projectNameController;
  late List<AposentoInstance> _aposentos;
  bool _isSaved = true;

  @override
  void initState() {
    super.initState();
    _projectNameController = TextEditingController(text: widget.project.name);
    _aposentos = List.from(widget.project.aposentos);
  }

  void _saveChanges() {
    double totalArea = _aposentos.fold(0, (sum, item) => sum + item.area);
    double totalCost = _aposentos.fold(0, (sum, item) => sum + item.totalCost);

    final updatedProject = Project(
      id: widget.project.id,
      name: _projectNameController.text,
      aposentos: _aposentos,
      totalArea: totalArea,
      totalCost: totalCost,
    );
    ProjectService.instance.updateProject(updatedProject);

    setState(() {
      _isSaved = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Proyecto actualizado'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _deleteAposento(int index) {
    setState(() {
      _aposentos.removeAt(index);
      _isSaved = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      symbol: '₡',
      decimalDigits: 0,
    );
    double totalArea = _aposentos.fold(0, (sum, item) => sum + item.area);
    double totalCost = _aposentos.fold(0, (sum, item) => sum + item.totalCost);

    return Scaffold(
      backgroundColor: AppColors.negroFondo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _projectNameController,
                      style: AppTextStyles.titulo,
                      decoration: InputDecoration.collapsed(
                        hintText: "Nombre del Proyecto",
                        hintStyle: AppTextStyles.titulo.copyWith(
                          color: AppColors.gris,
                        ),
                      ),
                      onChanged: (value) {
                        if (_isSaved) {
                          setState(() => _isSaved = false);
                        }
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: _saveChanges,
                        icon: Icon(
                          _isSaved ? Icons.check_circle : Icons.save_alt,
                          color:
                              _isSaved ? Colors.greenAccent : AppColors.blanco,
                        ),
                        label: Text(
                          'Guardar',
                          style: TextStyle(
                            color:
                                _isSaved
                                    ? Colors.greenAccent
                                    : AppColors.blanco,
                          ),
                        ),
                      ),
                      Text(
                        _isSaved ? 'Guardado' : 'Sin guardar',
                        style: TextStyle(
                          fontSize: 10,
                          color: _isSaved ? Colors.greenAccent : AppColors.gris,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(color: AppColors.azul2, height: 20, thickness: 1),
              Expanded(
                child:
                    _aposentos.isEmpty
                        ? Center(
                          child: Text(
                            "Este proyecto no tiene aposentos.",
                            style: AppTextStyles.pequeno.copyWith(
                              color: AppColors.gris,
                            ),
                          ),
                        )
                        : ListView.builder(
                          itemCount: _aposentos.length,
                          itemBuilder: (context, index) {
                            final aposento = _aposentos[index];
                            return Card(
                              color: AppColors.backgroundCard,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      aposento.aposentoType.imagePath,
                                      width: 60,
                                      height: 60,
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            aposento.aposentoType.name,
                                            style: AppTextStyles.listTileTitle,
                                          ),
                                          const SizedBox(height: 4),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.azul2,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              aposento.typology.id,
                                              style: AppTextStyles.pequeno
                                                  .copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.blanco,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${aposento.area.toStringAsFixed(2)} m²",
                                          style: AppTextStyles.pequeno,
                                        ),
                                        Text(
                                          currencyFormatter
                                              .format(aposento.totalCost)
                                              .replaceAll(',', ' '),
                                          style: AppTextStyles.listTileTitle,
                                        ),
                                        const SizedBox(height: 5),
                                        GestureDetector(
                                          onTap: () => _deleteAposento(index),
                                          child: Text(
                                            'Eliminar',
                                            style: AppTextStyles.pequenoLink
                                                .copyWith(fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
              ),
              const Divider(color: AppColors.azul2, height: 20, thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:', style: AppTextStyles.listTileTitle),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          currencyFormatter
                              .format(totalCost)
                              .replaceAll(',', ' '),
                          style: AppTextStyles.projectCardTitle.copyWith(
                            color: AppColors.azul2,
                          ),
                        ),
                        Text(
                          '${totalArea.toStringAsFixed(2)} m²',
                          style: AppTextStyles.pequeno.copyWith(
                            color: AppColors.gris,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.azul2,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text(
                  'Volver a Mis Proyectos',
                  style: TextStyle(color: AppColors.blanco),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  final currentProject = Project(
                    id: widget.project.id,
                    name: _projectNameController.text,
                    aposentos: _aposentos,
                    totalArea: totalArea,
                    totalCost: totalCost,
                  );
                  ProjectService.instance.startEditing(currentProject);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MainScaffold(initialIndex: 1),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.azul2,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text(
                  'Editar proyecto',
                  style: TextStyle(color: AppColors.blanco),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  await PdfService.generatePdf(
                    projectName: _projectNameController.text,
                    aposentos: _aposentos,
                    totalArea: totalArea,
                    totalCost: totalCost,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.azul1,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Descargar',
                      style: TextStyle(color: AppColors.blanco),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
