import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicableRegulationsScreen extends StatelessWidget {
  const ApplicableRegulationsScreen({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Text(
                        'Normativa legal',
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
                  const SizedBox(height: 40),
                  _buildSectionTitle('Leyes'),
                  const SizedBox(height: 25),
                  _buildRegulationButton(
                    context,
                    'Ley de construcciones (N° 833)',
                    'https://pgrweb.go.cr/scij/Busqueda/Normativa/Normas/nrm_texto_completo.aspx?param2=NRTC&nValor1=1&nValor2=36307',
                  ),
                  const SizedBox(height: 15),
                  _buildRegulationButton(
                    context,
                    'Ley de planificación urbana (N° 4240)',
                    'https://pgrweb.go.cr/scij/Busqueda/Normativa/Normas/nrm_texto_completo.aspx?nValor1=1&nValor2=35669',
                  ),
                  const SizedBox(height: 40),
                  _buildSectionTitle('Reglamentos'),
                  const SizedBox(height: 25),
                  _buildRegulationButton(
                    context,
                    'Reglamento de construcciones',
                    'https://www.invu.go.cr/documents/20181/32857/Reglamento+de+Construcciones',
                  ),
                  const SizedBox(height: 15),
                  _buildRegulationButton(
                    context,
                    'Reglamento de Seguridad',
                    'https://www.cso.go.cr/legislacion/decretos_normativa_reglamentaria/Reglamento%20Seguridad%20Construcciones.pdf',
                  ),
                  const SizedBox(height: 40),
                  _buildSectionTitle('Códigos'),
                  const SizedBox(height: 25),
                  _buildRegulationButton(
                    context,
                    'Código Sísmico de Costa Rica',
                    'https://www.codigosismico.or.cr/codigos.htm',
                  ),
                  const SizedBox(height: 15),
                  _buildRegulationButton(
                    context,
                    'Código Eléctrico de Costa Rica',
                    'https://cfia.or.cr/site/wp-content/uploads/2024/pdf/formularios/inspecciones/decreto-36979-meic-codigo-electrico-de-costa-rica-y-sus-reformas-a-febrero-2022.pdf',
                  ),
                  const SizedBox(height: 15),
                  _buildRegulationButton(
                    context,
                    'Código de Instalaciones Hidráulicas',
                    'https://www.cso.go.cr/ver/divulgacion/construccion/normativa/8.%20Codigo%20Instalacion%20Hidraulica.pdf',
                  ),
                  const SizedBox(height: 20),
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

  Widget _buildSectionTitle(String title) {
    return SizedBox(
      width: 375,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF9BAEBF),
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildRegulationButton(
    BuildContext context,
    String title,
    String url,
  ) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Container(
        width: 305,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF757575),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
