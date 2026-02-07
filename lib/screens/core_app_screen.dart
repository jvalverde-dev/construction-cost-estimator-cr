import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../data/app_data.dart';
import '../models/data_models.dart';
import '../services/pdf_service.dart';
import '../services/project_service.dart';
import '../theme/app_theme.dart';
import 'typology_details_screen.dart';

class CoreAppScreen extends StatefulWidget {
  const CoreAppScreen({super.key});

  @override
  State<CoreAppScreen> createState() => _CoreAppScreenState();
}

class _CoreAppScreenState extends State<CoreAppScreen> {
  final TextEditingController _largoController = TextEditingController();
  final TextEditingController _anchoController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  late TextEditingController _projectNameController;

  ConstructionMaterial? _selectedMaterial;
  Typology? _selectedTypology;
  int _selectedAposentoIndex = 0;
  bool _isAreaInputMode = false;
  List<AposentoInstance> _addedAposentos = [];
  bool _isProjectSaved = false;
  Project? _editingProject;
  late PageController _aposentoPageController;

  @override
  void initState() {
    super.initState();
    _editingProject = ProjectService.instance.projectBeingEdited;

    if (_editingProject != null) {
      _projectNameController = TextEditingController(
        text: _editingProject!.name,
      );
      _addedAposentos = List.from(_editingProject!.aposentos);
      _isProjectSaved = true;
    } else {
      _projectNameController = TextEditingController(text: "Nuevo Proyecto");
      _addedAposentos = [];
      _isProjectSaved = false;
    }

    _selectedMaterial = AppData.materials.first;
    _selectedTypology = _selectedMaterial?.typologies.first;
    _aposentoPageController = PageController(viewportFraction: 0.75);

    _largoController.addListener(_updateState);
    _anchoController.addListener(_updateState);
    _areaController.addListener(_updateState);
  }

  @override
  void dispose() {
    _largoController.dispose();
    _anchoController.dispose();
    _areaController.dispose();
    _projectNameController.dispose();
    _aposentoPageController.dispose();
    ProjectService.instance.stopEditing();
    super.dispose();
  }

  void _updateState() => setState(() {});

  void _setDimensionMode(bool isAreaMode) {
    if (_isAreaInputMode == isAreaMode) return;
    setState(() {
      _isAreaInputMode = isAreaMode;
      if (isAreaMode) {
        _largoController.clear();
        _anchoController.clear();
      } else {
        _areaController.clear();
      }
    });
  }

  bool _isFormValid() {
    final hasTypology = _selectedTypology != null;
    final hasArea =
        _areaController.text.isNotEmpty &&
        (double.tryParse(_areaController.text) ?? 0) > 0;
    final hasDimensions =
        _largoController.text.isNotEmpty &&
        (double.tryParse(_largoController.text) ?? 0) > 0 &&
        _anchoController.text.isNotEmpty &&
        (double.tryParse(_anchoController.text) ?? 0) > 0;
    return hasTypology && (hasArea || hasDimensions);
  }

  void _addAposento() {
    if (!_isFormValid()) return;
    final area =
        _isAreaInputMode
            ? double.parse(_areaController.text)
            : double.parse(_largoController.text) *
                double.parse(_anchoController.text);
    final newAposento = AposentoInstance(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      aposentoType: AppData.aposentoTypes[_selectedAposentoIndex],
      typology: _selectedTypology!,
      area: area,
      totalCost: area * _selectedTypology!.costPerSqm,
    );
    setState(() {
      _addedAposentos.add(newAposento);
      _resetForm();
    });
  }

  void _resetForm() {
    _largoController.clear();
    _anchoController.clear();
    _areaController.clear();
    setState(() => _isAreaInputMode = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.negroFondo,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Estimador de costos',
                            style: AppTextStyles.titulo,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, top: 4.0),
                          child: Text(
                            _projectNameController.text,
                            style: AppTextStyles.pequeno.copyWith(
                              color: AppColors.gris,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildMaterialSelector(),
                        const SizedBox(height: 25),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tipo',
                                style: AppTextStyles.listTileTitle,
                              ),
                              const SizedBox(height: 8),
                              _buildTypologySelector(context),
                            ],
                          ),
                        ),
                        _buildAposentoCarousel(),
                        const SizedBox(height: 25),
                        Center(
                          child: SizedBox(
                            width: 320,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Dimensiones',
                                  style: AppTextStyles.listTileTitle,
                                ),
                                const SizedBox(height: 8),
                                _buildDimensionInputs(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildAddButton(),
                        const Expanded(child: SizedBox()),
                        _buildAposentosAgregadosButton(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMaterialSelector() {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.azul1,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children:
            AppData.materials.map((material) {
              bool isSelected = _selectedMaterial?.name == material.name;
              return Expanded(
                child: GestureDetector(
                  onTap:
                      () => setState(() {
                        _selectedMaterial = material;
                        _selectedTypology = material.typologies.first;
                      }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.azul2 : Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        material.name,
                        style: AppTextStyles.pequeno.copyWith(
                          color: AppColors.blanco,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildTypologySelector(BuildContext context) {
    return GestureDetector(
      onTap: () => _showTypologyPicker(context),
      child: Container(
        height: 40,
        width: 240,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.azul2,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderDefault),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedTypology?.id ?? 'Seleccione',
              style: AppTextStyles.listTileTitle.copyWith(
                color: AppColors.blanco,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildAposentoCarousel() {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed:
                      () => _aposentoPageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _aposentoPageController,
                    itemCount: AppData.aposentoTypes.length,
                    onPageChanged:
                        (index) =>
                            setState(() => _selectedAposentoIndex = index),
                    itemBuilder: (context, index) {
                      final aposento = AppData.aposentoTypes[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(aposento.imagePath, height: 180),
                          const SizedBox(height: 10),
                          Text(
                            aposento.name,
                            style: AppTextStyles.listTileTitle,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed:
                      () => _aposentoPageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              AppData.aposentoTypes.length,
              (i) => _buildIndicator(i == _selectedAposentoIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) => AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 4.0),
    height: 8.0,
    width: 8.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color:
          isActive ? AppColors.azul2 : AppColors.azul2.withValues(alpha: 0.3),
    ),
  );

  Widget _buildDimensionInputs() {
    double fieldWidth = 100;
    double gapWidth = 10;
    double indicatorWidth =
        _isAreaInputMode ? fieldWidth : (fieldWidth * 2 + gapWidth);
    double indicatorLeft = _isAreaInputMode ? (fieldWidth + gapWidth) * 2 : 0;

    return Column(
      children: [
        Row(
          children: [
            _buildTextField('Largo (m)', _largoController, !_isAreaInputMode),
            SizedBox(width: gapWidth),
            _buildTextField('Ancho (m)', _anchoController, !_isAreaInputMode),
            SizedBox(width: gapWidth),
            _buildTextField('Área (m²)', _areaController, _isAreaInputMode),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: fieldWidth * 3 + gapWidth * 2,
          height: 2,
          child: Stack(
            children: [
              Container(color: AppColors.blanco.withValues(alpha: 0.5)),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: indicatorLeft,
                child: Container(
                  width: indicatorWidth,
                  height: 2,
                  color: const Color.fromARGB(255, 71, 115, 153),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    bool isEnabled,
  ) {
    return GestureDetector(
      onTap: () => _setDimensionMode(label == 'Área (m²)'),
      child: SizedBox(
        width: 100,
        height: 40,
        child: TextField(
          controller: controller,
          enabled: isEnabled,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          textAlign: TextAlign.center,
          style: AppTextStyles.listTileTitle.copyWith(
            color: isEnabled ? AppColors.blanco : AppColors.buttonDisabled,
          ),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              color:
                  isEnabled
                      ? AppColors.blanco.withValues(alpha: 0.7)
                      : AppColors.buttonDisabled,
              fontSize: 14,
            ),
            filled: true,
            fillColor: isEnabled ? AppColors.azul2 : AppColors.blanco,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    bool isValid = _isFormValid();
    return Center(
      child: SizedBox(
        width: 102,
        height: 45,
        child: ElevatedButton(
          onPressed: isValid ? _addAposento : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.azul1,
            disabledBackgroundColor: AppColors.buttonDisabled,
            foregroundColor: AppColors.blanco,
            disabledForegroundColor: AppColors.blanco.withValues(alpha: 0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsets.zero,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 20),
              SizedBox(height: 2),
              Text('Agregar', style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAposentosAgregadosButton() {
    return ElevatedButton(
      onPressed: _showAposentosPanel,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.azul2,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Aposentos agregados (${_addedAposentos.length})',
            style: AppTextStyles.listTileTitle.copyWith(
              color: AppColors.blanco,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.expand_less, color: AppColors.blanco),
        ],
      ),
    );
  }

  void _showTypologyPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.negroFondo.withValues(alpha: 0.95),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        final typologies = _selectedMaterial?.typologies ?? [];
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Tipos de vivienda', style: AppTextStyles.titulo),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: typologies.length,
                    itemBuilder: (context, index) {
                      final typology = typologies[index];
                      return ListTile(
                        title: Text(
                          typology.id,
                          style: AppTextStyles.listTileTitle.copyWith(
                            color: AppColors.azul2,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.info_outline,
                            color: AppColors.azul2,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => TypologyDetailsScreen(
                                      typology: typology,
                                      materialName:
                                          _selectedMaterial?.name ?? '',
                                    ),
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          setState(() => _selectedTypology = typology);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  iconSize: 24,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.azul2,
                    fixedSize: const Size(40, 40),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAposentosPanel() {
    if (_editingProject == null) {
      _projectNameController.text = "Nuevo Proyecto";
      _isProjectSaved = false;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            final currencyFormatter = NumberFormat.currency(
              symbol: '₡',
              decimalDigits: 0,
            );

            return DraggableScrollableSheet(
              initialChildSize: 0.85,
              maxChildSize: 0.85,
              builder: (_, scrollController) {
                double totalArea = _addedAposentos.fold(
                  0,
                  (sum, item) => sum + item.area,
                );
                double totalCost = _addedAposentos.fold(
                  0,
                  (sum, item) => sum + item.totalCost,
                );

                return Container(
                  decoration: const BoxDecoration(
                    color: AppColors.negroFondo,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
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
                                if (_isProjectSaved) {
                                  setModalState(() => _isProjectSaved = false);
                                }
                              },
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  if (_addedAposentos.isNotEmpty &&
                                      !_isProjectSaved) {
                                    if (_editingProject != null) {
                                      final updatedProject = Project(
                                        id: _editingProject!.id,
                                        name: _projectNameController.text,
                                        aposentos: _addedAposentos,
                                        totalArea: totalArea,
                                        totalCost: totalCost,
                                      );
                                      ProjectService.instance.updateProject(
                                        updatedProject,
                                      );
                                    } else {
                                      final newProject = Project(
                                        id:
                                            DateTime.now()
                                                .millisecondsSinceEpoch
                                                .toString(),
                                        name: _projectNameController.text,
                                        aposentos: List.from(_addedAposentos),
                                        totalArea: totalArea,
                                        totalCost: totalCost,
                                      );
                                      ProjectService.instance.addProject(
                                        newProject,
                                      );
                                    }

                                    setModalState(() => _isProjectSaved = true);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Proyecto guardado con éxito',
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
                                icon: Icon(
                                  _isProjectSaved
                                      ? Icons.check_circle_outline
                                      : Icons.cloud_upload_outlined,
                                  color:
                                      _isProjectSaved
                                          ? Colors.greenAccent
                                          : AppColors.blanco,
                                ),
                                label: Text(
                                  'Guardar',
                                  style: TextStyle(
                                    color:
                                        _isProjectSaved
                                            ? Colors.greenAccent
                                            : AppColors.blanco,
                                  ),
                                ),
                              ),
                              Text(
                                _isProjectSaved ? 'Guardado' : 'Sin guardar',
                                style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      _isProjectSaved
                                          ? Colors.greenAccent
                                          : AppColors.gris,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.azul2,
                        height: 20,
                        thickness: 1,
                      ),
                      Expanded(
                        child:
                            _addedAposentos.isEmpty
                                ? Center(
                                  child: Text(
                                    "Aún no has agregado aposentos.",
                                    style: AppTextStyles.pequeno.copyWith(
                                      color: AppColors.gris,
                                    ),
                                  ),
                                )
                                : ListView.builder(
                                  controller: scrollController,
                                  itemCount: _addedAposentos.length,
                                  itemBuilder: (context, index) {
                                    final aposento = _addedAposentos[index];
                                    return Card(
                                      color: AppColors.backgroundCard,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
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
                                                    style:
                                                        AppTextStyles
                                                            .listTileTitle,
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 2,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.azul2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      aposento.typology.id,
                                                      style: AppTextStyles
                                                          .pequeno
                                                          .copyWith(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                AppColors
                                                                    .blanco,
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
                                                  style: AppTextStyles.pequeno
                                                      .copyWith(
                                                        color: AppColors.blanco,
                                                      ),
                                                ),
                                                Text(
                                                  currencyFormatter
                                                      .format(
                                                        aposento.totalCost,
                                                      )
                                                      .replaceAll(',', ' '),
                                                  style: AppTextStyles
                                                      .listTileTitle
                                                      .copyWith(
                                                        color: AppColors.blanco,
                                                      ),
                                                ),
                                                const SizedBox(height: 5),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(
                                                      () => _addedAposentos
                                                          .removeAt(index),
                                                    );
                                                    setModalState(() {
                                                      _isProjectSaved = false;
                                                    });
                                                  },
                                                  child: Text(
                                                    'Eliminar',
                                                    style: AppTextStyles
                                                        .pequenoLink
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
                      const Divider(
                        color: AppColors.azul2,
                        height: 20,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total:',
                              style: AppTextStyles.listTileTitle,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  currencyFormatter
                                      .format(totalCost)
                                      .replaceAll(',', ' '),
                                  style: AppTextStyles.projectCardTitle
                                      .copyWith(color: AppColors.azul2),
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
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.azul2,
                          foregroundColor: AppColors.blanco,
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 4),
                            Text('Volver a estimador de costos'),
                            Icon(Icons.chevron_left, size: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () async {
                          if (_addedAposentos.isNotEmpty) {
                            await PdfService.generatePdf(
                              projectName: _projectNameController.text,
                              aposentos: _addedAposentos,
                              totalArea: totalArea,
                              totalCost: totalCost,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.azul1,
                          foregroundColor: AppColors.blanco,
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Descargar'),
                            SizedBox(width: 4),
                            Icon(Icons.keyboard_arrow_down, size: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
