import 'package:flutter/material.dart';
import 'package:flutter_application/arayuz/sharedkonusu.dart';
import 'package:flutter_application/sayfalar/arsiv.dart';

class AppBarSayfasi extends StatefulWidget {
  final String gelenDeger;
  AppBarSayfasi(
      {this.gelenDeger}); // köşeli parantez isteğe bağlı şekilde değer göndermeye bilirsin
  @override
  State<StatefulWidget> createState() => AppBarState();
}

class AppBarState extends State<AppBarSayfasi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.gelenDeger != null
              ? widget.gelenDeger
              : "App bar sayfası"),
              bottom: TabBar(
                tabs: <Widget>[
                   Icon(Icons.access_alarm),
                   Icon(Icons.face),
                   Icon(Icons.accessibility_new_outlined),
                ],
              ),
        ), 
        body: TabBarView(
          children: <Widget>[
             Container(color: Colors.amber),
             ArsivSayfasi(),
             SharedKonusu(),
          ],
        ),
      ),
    );
  }
}
