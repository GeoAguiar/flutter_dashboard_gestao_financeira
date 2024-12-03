import 'package:flutter/material.dart';

class Estilos {
  static const double paddingPadrao = 16.0;
  static TextStyle titulo = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static Color corDeFundo = const Color(0xff167ce8);
  static Color corPadraoVermelha = const Color(0xffff698a);
  static Color corPadraoAmarela = const Color(0xFFfedd69);
  static Color corPadraoAzul = const Color(0xff52beff);
  static Color corPadraoCinza = const Color(0xff77839a);
  static Color corCinzaClara = const Color(0xffc4c4c4);
  static Color corBrancaClara = const Color(0xFFf2f6fe);


  static BorderRadius bordaArredondadaPadrao = BorderRadius.circular(20);

  static ScrollbarThemeData temaBarraDeRolagem =
  const ScrollbarThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(corPadraoAmarela),
    thumbVisibility: MaterialStateProperty.all(false), // Bool encapsulada no MaterialStateProperty
    interactive: true,
  );
}
