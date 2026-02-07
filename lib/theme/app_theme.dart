import 'package:flutter/material.dart';

class AppColors {
  static const Color negroFondo = Color(0xFF2C2C2C);
  static const Color cardBackground = Color(0xFF3A3A3C);

  static const Color azul1 = Color(0xFF516D85);
  static const Color azul2 = Color(0xFF9BAEBF);
  static const Color blanco = Color(0xFFFFFFFF);
  static const Color gris = Color(0xFFE3E3E3);
  static const Color negro = Color(0xFF000000);
  static const Color grisSecundario = Color(0xFFD9D9D9);
  static const Color backgroundCard = Color(0x33757575);

  static const Color projectCardBackground = Color(0xFF1E1E1E);

  static const Color switchBackgroundInactive = Color(0x5B787880);
  static const Color switchThumb = Color(0xFFFFFFFF);

  static const Color inputEnabled = Color(0xFFE3E3E3);
  static const Color inputDisabled = Color(0xFF757575);
  static const Color inputTextDisabled = Color(0xFFABABAB);
  static const Color borderDefault = Color(0xFF444444);

  static const Color buttonDisabled = Color(0xFF757575);
}

class AppTextStyles {
  static const String _fontFamily = 'Montserrat';

  static const TextStyle titulo = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    color: AppColors.blanco,
  );

  static const TextStyle subtitulo = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.40,
    color: AppColors.blanco,
  );

  static const TextStyle listTileTitle = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle projectCardTitle = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle projectCost = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.gris,
  );

  static const TextStyle pequeno = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.2,
    color: AppColors.blanco,
  );

  static const TextStyle pequenoLink = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1,
    color: AppColors.azul1,
    decoration: TextDecoration.underline,
  );

  static const TextStyle pequenoItalic = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    fontSize: 12,
    height: 1.2,
    color: AppColors.azul2,
  );

  static const TextStyle micro = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 1,
    color: AppColors.blanco,
  );

  static const TextStyle pequenoResaltado = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.2,
    color: AppColors.blanco,
  );
}
