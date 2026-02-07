import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';

class AssociatedTaxesScreen extends StatefulWidget {
  const AssociatedTaxesScreen({super.key});

  @override
  State<AssociatedTaxesScreen> createState() => _AssociatedTaxesScreenState();
}

class _AssociatedTaxesScreenState extends State<AssociatedTaxesScreen> {
  final TextEditingController _budgetController = TextEditingController();

  double _municipalidad = 0.0;
  double _cfia = 0.0;
  double _servicios = 0.0;
  double _construccion = 0.0;

  final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'es_CR',
    symbol: '₡',
    decimalDigits: 2,
  );

  @override
  void dispose() {
    _budgetController.dispose();
    super.dispose();
  }

  void _calculateValues(String value) {
    String cleanValue = value.replaceAll(RegExp(r'[^0-9.]'), '');

    if (cleanValue.isEmpty) {
      setState(() {
        _municipalidad = 0.0;
        _cfia = 0.0;
        _servicios = 0.0;
        _construccion = 0.0;
      });
      return;
    }

    double totalBudget = double.tryParse(cleanValue) ?? 0.0;

    setState(() {
      _municipalidad = totalBudget * 0.01;
      _cfia = totalBudget * 0.00265;
      _servicios = totalBudget * 0.27;
      _construccion = totalBudget * 0.71735;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.negroFondo,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Impuestos asociados',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Distribución de costos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 247,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3E3E3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _budgetController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2C2C2C),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Presupuesto (₡)',
                        hintStyle: TextStyle(
                          color: Color(0xFF757575),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onChanged: _calculateValues,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        _buildChartRow(
                          label: 'CFIA\n(0,265 %)',
                          amount: _cfia,
                          blockHeight: 6,
                        ),
                        const SizedBox(height: 12),
                        _buildChartRow(
                          label: 'Municipalidad\n(1 %)',
                          amount: _municipalidad,
                          blockHeight: 12,
                        ),
                        const SizedBox(height: 12),
                        _buildChartRow(
                          label: 'Servicios\nprofesionales\n(27 %)',
                          amount: _servicios,
                          blockHeight: 130,
                        ),
                        const SizedBox(height: 12),
                        _buildChartRow(
                          label: 'Construcción\n(71,735 %)',
                          amount: _construccion,
                          blockHeight: 300,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.of(context).pop(),
                    backgroundColor: const Color(
                      0xFF90A4AE,
                    ).withValues(alpha: 0.8),
                    elevation: 0,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartRow({
    required String label,
    required double amount,
    required double blockHeight,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF9BAEBF),
              fontSize: 10,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          width: 100,
          height: blockHeight,
          decoration: const BoxDecoration(color: Colors.white),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            _currencyFormat.format(amount),
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Color(0xFFE3E3E3),
              fontSize: 10,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
