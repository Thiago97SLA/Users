import 'package:flutter/material.dart';
import 'package:users/src/widget/Loading.Dart';
import 'package:users/src/widget/FontWidget.Dart';
import 'package:users/src/services/getPlubish.dart';
import 'package:users/src/Screen/Publish/widget/BtnClose.dart';
import 'package:users/src/Screen/Publish/widget/ContainerInfoPublish.dart';

void openInfo(BuildContext context, int id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0.0),
          content: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: ListBody(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                        color: Color(0xFF345e3a),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4))),
                    width: MediaQuery.of(context).size.width,
                    child: FontWidget(
                        text: 'Publicaciones',
                        size: 20,
                        color: 0xFFFFFFFF,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center),
                  ),
                  FutureBuilder(
                    future: getInfoPublish(id),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return snapshot.hasData
                          ? ContainerInfoPublish(
                              data: snapshot.data,
                            )
                          : Container(
                              margin: EdgeInsets.all(10), child: loadinginfo());
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: btnClose(),
                  )
                ],
              ),
            ),
          ));
    },
  );
}
