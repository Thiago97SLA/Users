import 'package:flutter/material.dart';
import 'package:users/src/widget/FontWidget.Dart';
import 'package:users/src/Screen/Publish/InfoPublish.Dart';

class ContainerUsers extends StatelessWidget {
  const ContainerUsers({
    Key key,
    @required this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: FontWidget(
                    text: data[index].name,
                    size: 16,
                    color: 0xFF345e3a,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.phone, color: Color(0xFF345e3a)),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width - 100,
                      alignment: Alignment.centerLeft,
                      child: FontWidget(
                          text: data[index].phone,
                          size: 14,
                          color: 0xFF0000000,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.email, color: Color(0xFF345e3a)),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width - 100,
                      alignment: Alignment.centerLeft,
                      child: FontWidget(
                          text: data[index].email,
                          size: 14,
                          color: 0xFF0000000,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        openInfo(context, data[index].id);
                      },
                      child: Container(
                        child: FontWidget(
                            text: 'Ver publicaciones'.toUpperCase(),
                            size: 14,
                            color: 0xFF345e3a,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.start),
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
