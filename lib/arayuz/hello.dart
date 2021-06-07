import 'package:flutter/material.dart';
import 'package:flutter_application/item/degiskenler.dart';

class Hello extends StatelessWidget {
  final String ad = Degiskenler.ad;
  final String deneme = Degiskenler().deneme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello")),
      body: Container(
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: new Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: new Container(
            color: Colors.grey,
            alignment: Alignment.center,
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              verticalDirection: VerticalDirection.down,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  verticalDirection: VerticalDirection.down,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.all(30),
                      child: Text(
                        ad,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.all(30),
                      child: Text(
                        ad,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
