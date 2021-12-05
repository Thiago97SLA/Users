import 'package:flutter/material.dart';
import 'package:users/src/widget/FontWidget.Dart';

Widget buildAppBar() {
  return AppBar(
    title: FontWidget(
      text: 'Prueba de Ingreso',
      size: 20,
      color: 0xFFFFFFFF,
      fontWeight: FontWeight.w700,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    ),
    backgroundColor: Color(0xFF2a6031),
  );
}
