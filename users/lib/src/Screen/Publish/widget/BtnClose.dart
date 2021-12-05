import 'package:flutter/material.dart';
import 'package:users/src/widget/FontWidget.Dart';

Widget btnClose() {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.red,
    ),
    width: 120,
    height: 40,
    child: FontWidget(
      text: 'Cerrar',
      size: 20,
      color: 0xFFFFFFFF,
      fontWeight: FontWeight.w700,
      textAlign: TextAlign.center,
    ),
  );
}
