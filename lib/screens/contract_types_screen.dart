import 'package:flutter/material.dart';

class ContractTypesScreen extends StatelessWidget {
  const ContractTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Text(
                        'Tipos de contratos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildContractCard(
                    title: 'Llave en mano',
                    priceType: 'Fijo',
                    riskHolder: 'Contratista',
                    advantages:
                        'El cliente recibe la obra terminada y conoce el costo total de antemano.',
                    disadvantages:
                        'Menor flexibilidad para cambios y posible costo más alto inicial (por el riesgo del contratista).',
                  ),
                  const SizedBox(height: 20),
                  _buildContractCard(
                    title: 'Suma alzada',
                    priceType: 'Fijo',
                    riskHolder: 'Contratista',
                    advantages:
                        'El cliente conoce el costo desde el inicio. Incentiva la eficiencia del contratista.',
                    disadvantages:
                        'Poca flexibilidad para modificaciones. Riesgo de sacrificar calidad para reducir costos.',
                  ),
                  const SizedBox(height: 20),
                  _buildContractCard(
                    title: 'Por administración',
                    priceType: 'Variable',
                    riskHolder: 'Cliente',
                    advantages:
                        'El cliente tiene control total sobre decisiones, compras y calidad. Transparencia de costos reales. Flexible a cambios.',
                    disadvantages:
                        'Alto riesgo de sobrecostos y difícil de presupuestar. Requiere alto involucramiento del propietario.',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
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

  Widget _buildContractCard({
    required String title,
    required String priceType,
    required String riskHolder,
    required String advantages,
    required String disadvantages,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: ShapeDecoration(
        color: const Color(0xFF2C2C2C),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          _buildRowInfo('Precio', priceType),
          const SizedBox(height: 22),
          _buildRowInfo('Riesgo recae en', riskHolder),
          const SizedBox(height: 22),
          _buildRowInfo('Ventajas', advantages),
          const SizedBox(height: 22),
          _buildRowInfo('Desventajas', disadvantages),
        ],
      ),
    );
  }

  Widget _buildRowInfo(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFF9BAEBF),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
