import 'package:flutter/material.dart';

class ProfessionalServicesScreen extends StatelessWidget {
  const ProfessionalServicesScreen({super.key});

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
                        'Contratación de \nservicios profesionales',
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
                  const Text(
                    'Honorarios profesionales',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Porcentajes respecto a valor total de la obra',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTableCard(
                    title: 'Construcción nueva',
                    sections: [
                      _TableSection(
                        header: 'Planos y documentos',
                        rows: [
                          _TableRow('Estudios preliminares', '0.50 %'),
                          _TableRow('Anteproyecto', '1.00 %'),
                          _TableRow('Planos', '4.00 %'),
                          _TableRow(
                            'Presupuesto',
                            '0.50 % Global o\n1.00% Detallado',
                          ),
                          _TableRow('Adjudicación', '0.50 %'),
                        ],
                      ),
                      _TableSection(
                        header: 'Control y ejecución',
                        rows: [
                          _TableRow('Inspección', '3.00 %'),
                          _TableRow('Dirección de obra', '5.00 %'),
                          _TableRow('Administración', '12.00 %'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildTableCard(
                    title: 'Remodelación',
                    sections: [
                      _TableSection(
                        header: 'Planos y documentos',
                        rows: [
                          _TableRow('Estudios preliminares', '0.75 %'),
                          _TableRow('Anteproyecto', '1.50 %'),
                          _TableRow('Planos', '6.00 %'),
                          _TableRow(
                            'Presupuesto',
                            '0.50 % Global o\n1.00% Detallado',
                          ),
                          _TableRow('Adjudicación', '0.50 %'),
                        ],
                      ),
                      _TableSection(
                        header: 'Control y ejecución',
                        rows: [
                          _TableRow('Inspección', '4.50 %'),
                          _TableRow('Dirección de obra', '7.50 %'),
                          _TableRow('Administración', '18.00 %'),
                        ],
                      ),
                    ],
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

  Widget _buildTableCard({
    required String title,
    required List<_TableSection> sections,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFF2C2C2C),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ...sections.map((section) => _buildSection(section)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSection(_TableSection section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Text(
            section.header,
            style: const TextStyle(
              color: Color(0xFF516D85),
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...section.rows.map((row) => _buildRow(row)),
      ],
    );
  }

  Widget _buildRow(_TableRow row) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Text(
              row.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              row.value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF9BAEBF),
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TableSection {
  final String header;
  final List<_TableRow> rows;
  _TableSection({required this.header, required this.rows});
}

class _TableRow {
  final String label;
  final String value;
  _TableRow(this.label, this.value);
}
