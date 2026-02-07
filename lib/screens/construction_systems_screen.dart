import 'package:flutter/material.dart';

class ConstructionSystemsScreen extends StatelessWidget {
  const ConstructionSystemsScreen({super.key});

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
                        'Sistemas constructivos',
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
                  const SizedBox(height: 15),
                  const Text(
                    '5 sistemas constructivos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Según CSCR 2014 (Revisión 2014)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildSystemItem(
                    number: '1',
                    title: 'Mampostería',
                    subtitle: 'De concreto o arcilla',
                    description:
                        'Este sistema utiliza pieza individuales que se apilan unas sobre otras, en el mercado costarricense se les llama “blocks” y pueden ser tanto de concreto como de arcilla, rellenas o huecas.\nEl sistema puede llevar refuerzo de acero horizontal y vertical y/o confinarse con otros elementos estructurales.',
                    imagePath: 'assets/images/SistemaConstructivos-01.png',
                  ),
                  _buildSystemItem(
                    number: '2',
                    title: 'Concreto reforzado',
                    subtitle: '',
                    description:
                        'Este sistema se moldea en sitio. Se utilizan encofrados -también llamados formaletas- para contener el concreto a verter. El sistema debe contener acero de refuerzo definido por el profesional a cargo.',
                    imagePath: 'assets/images/SistemaConstructivos-02.png',
                  ),
                  _buildSystemItem(
                    number: '3',
                    title: 'Paneles o baldosas',
                    subtitle: 'Horizontales o verticales',
                    description:
                        'Este sistema consiste de paneles de concreto prefabricado. En el mercado costarricense actual predominan los sistemas de baldosas horizontales confinadas con columnas; sin embargo, también existen baldosas verticales que entran en la misma categoría.',
                    imagePath: 'assets/images/SistemaConstructivos-03.png',
                  ),
                  _buildSystemItem(
                    number: '4',
                    title: 'Planchas con estructura interna',
                    subtitle: 'Liviano',
                    description:
                        'Se suelen llamar sistemas livianos.\n\nSe conforman por una estructura interna de madera o de perfiles de acero forrada con planchas delgadas de fibrocemento, madera, compuestos de madera u otros.',
                    imagePath: 'assets/images/SistemaConstructivos-04.png',
                  ),
                  _buildSystemItem(
                    number: '5',
                    title: 'Tipo emparedado',
                    subtitle: '',
                    description:
                        'Poseen una malla metálica tridimensional con relleno de poliestireno expandido (como el estereofón).',
                    imagePath: 'assets/images/SistemaConstructivos-05.png',
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

  Widget _buildSystemItem({
    required String number,
    required String title,
    required String subtitle,
    required String description,
    required String imagePath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, left: 24, right: 24),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF455A64),
                  child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.white54,
                    size: 50,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: Text(
              '$number - $title',
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Text(
                subtitle,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Text(
              description,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Color(0xFF9BAEBF),
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
