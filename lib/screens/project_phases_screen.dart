import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ProjectPhasesScreen extends StatelessWidget {
  const ProjectPhasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.negroFondo,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 100,
            left: 24,
            right: 24,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    'Fases de un proyecto',
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
                '10 pasos para construir vivienda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  height: 1.40,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Según CFIA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 1.29,
                  letterSpacing: -0.08,
                ),
              ),
              const SizedBox(height: 48),
              _buildPhaseCard(
                title: '1-Adquisición de propiedad',
                content: _buildRichText([
                  _span('Verificar inscripción en el Registro Nacional.\n\n'),
                  _span(
                    'Constatar la información del Plano Catastro (de no contar con este documento se debe tramitar a través de un Ingeniero Topógrafo registrado).\n\n',
                  ),
                  _span(
                    'Considerar las limitaciones del terreno por medio del "Uso de Suelo", este documento se tramita con la Municipalidad correspondiente.\n\n',
                  ),
                  _span(
                    'Si la propiedad no se ha adquirido, el avalúo debe realizarlo un profesional de la Ingeniería o la Arquitectura.',
                  ),
                ]),
              ),
              _buildPhaseCard(
                title: '2-Información previa al diseño',
                content: _buildRichText([
                  _span(
                    'Consultar normativa pertinente para verificar retiros, servidumbres, cuerpos de agua u otras posibles restricciones.\n\n',
                  ),
                  _headerSpan('Normativa municipal:\n'),
                  _span(
                    'Uso de suelo\nPlan regulador\nAltura máxima de las edificaciones\nRetiros de construcción\n\n',
                  ),
                  _headerSpan('Normativa institucional:\n'),
                  _subHeaderSpan('AYA (o entidad correspondiente): '),
                  _span(
                    'Disponibilidad de agua potable, alcantarillado sanitario, servidumbre por paso de tubería.\n',
                  ),
                  _subHeaderSpan('ICE (o entidad correspondiente): '),
                  _span('Disponibilidad de electricidad.\n'),
                  _subHeaderSpan('MOPT: '),
                  _span(
                    'Alineamiento de carreteras cercanas, líneas de ferrocarril.\n',
                  ),
                  _subHeaderSpan('INVU: '),
                  _span('Alineamientos por cuerpos de agua.\n'),
                  _subHeaderSpan('Ministerio de salud: '),
                  _span(
                    'Disposición de aguas residuales y afectaciones por servidumbres.\n',
                  ),
                  _subHeaderSpan('CNE: '),
                  _span('Zonas de riesgo natural.'),
                ]),
              ),
              _buildPhaseCard(
                title: '3-Etapa de diseño',
                content: _buildRichText([
                  _span(
                    'Se debe contratar a un profesional en Ingeniería Civil o Arquitectura para ejecutar:\n\n',
                  ),
                  _span(
                    'Anteproyecto\nPlanos de construcción\nEspecificaciones técnicas\nPresupuesto',
                  ),
                ]),
              ),
              _buildPhaseCard(
                title: '4-Trámite digital APC',
                content: _buildRichText([
                  _span(
                    'El profesional registra los planos y su responsabilidad profesional en la plataforma APC del CFIA.\n\n',
                  ),
                  _span(
                    'De no cumplir con algún requisito se devolverán con las indicaciones correspondientes.\n\n',
                  ),
                  _span(
                    'Tras cumplir con todos los requisitos se aprobarán los planos y los devolverá sellados.\n\n',
                  ),
                  _span(
                    'Se debe pagar el 0.265% del valor de la obra definido por la tasación del CFIA, y la póliza de riesgos del INS.',
                  ),
                ]),
              ),
              _buildPhaseCard(
                title: '5-Permiso Municipal de Construcción',
                content: _buildRichText([
                  _span(
                    'Presentar planos sellados y póliza del INS a la Municipalidad.\n\n',
                  ),
                  _span(
                    'Se debe pagar el 1% del valor estimado de la obra para obtener el Permiso de Construcción.',
                  ),
                ]),
              ),
              _buildPhaseCard(
                title: '6-Etapa constructiva',
                content: _buildRichText([
                  _span('Se debe de contratar la ejecución de la obra:\n'),
                  _span('Inspección\nDirección de obra\nAdministración\n\n'),
                  TextSpan(
                    text: 'Nota: ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Se recomienda dejar bien detallado el alcance en el contrato, así como las responsabilidades del profesional y del cliente.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ]),
              ),
              _buildPhaseCard(
                title: '7-Manejo de residuos de construcción',
                content: _buildRichText([
                  _span(
                    'Planificar la gestión de residuos de construcción y demolición, cumpliendo con la Ley N° 8839 (Gestión Integral de Residuos).\n\n',
                  ),
                  _span(
                    'Solicitar al profesional responsable la aplicación de esta ley.',
                  ),
                ]),
              ),
              _buildPhaseCard(
                title: '8-Finalización del proyecto',
                content: _buildRichText([
                  _span(
                    'Entrega formal de la obra donde participen Director Técnico, Constructor y Cliente.\n\n',
                  ),
                  _span(
                    'Los profesionales tienen una responsabilidad de 5 años (Código Civil de Costa Rica).',
                  ),
                ]),
              ),
              _buildPhaseCard(
                title: '9-Mantenimiento de la vivienda',
                content: _buildRichText([
                  _span('Realizar mantenimiento constante.\n\n'),
                  _span(
                    'Actividades que no impliquen aumento de área de la edificación (pintura, cambio de techo, aceras) no requieren sellado del CFIA.',
                  ),
                ]),
              ),
              _buildPhaseCard(
                title: '10-Ampliaciones de la vivienda',
                content: _buildRichText([
                  _span(
                    'Toda obra que aumente el área se considera una ampliación y requiere nuevos planos, trámite CFIA/Municipalidad, y profesionales que revisen la estructura existente a intervenir.',
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
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

  Widget _buildPhaseCard({required String title, required Widget content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        border: Border.all(color: const Color(0xFF444444), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              height: 1.29,
              letterSpacing: -0.08,
            ),
          ),
          children: [Align(alignment: Alignment.centerLeft, child: content)],
        ),
      ),
    );
  }

  Widget _buildRichText(List<InlineSpan> spans) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 1.40,
        ),
        children: spans,
      ),
    );
  }

  TextSpan _span(String text) {
    return TextSpan(text: text);
  }

  TextSpan _headerSpan(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 13,
        height: 1.5,
      ),
    );
  }

  TextSpan _subHeaderSpan(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
    );
  }
}
