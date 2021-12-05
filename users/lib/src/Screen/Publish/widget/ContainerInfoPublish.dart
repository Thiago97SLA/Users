import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:users/src/widget/FontWidget.Dart';

class ContainerInfoPublish extends StatelessWidget {
  final dynamic data;

  const ContainerInfoPublish({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(8),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: FontWidget(
                      text: data[index]['title'].toUpperCase(),
                      size: 16,
                      color: 0xFF345e3a,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: FontWidget(
                      text: data[index]['body'],
                      size: 14,
                      color: 0xFF000000,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
