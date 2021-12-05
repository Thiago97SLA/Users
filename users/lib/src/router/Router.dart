import 'package:flutter/material.dart';

import 'package:users/src/Screen/Home/Home.Dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => Home(),
  };
}
