import 'package:flutter/material.dart';

Widget loadinginfo() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    alignment: Alignment.bottomCenter,
    child: Column(
      children: [
        CircularProgressIndicator(),
      ],
    ),
  );
}
