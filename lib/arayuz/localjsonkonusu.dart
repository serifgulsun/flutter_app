import 'dart:convert';

import 'package:flutter/material.dart';

class LocalJsonKonusu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JsonState();
}

class JsonState extends State<LocalJsonKonusu> {
  List ogrenci;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("local json konusu"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/veriler/sinif.json"),
              builder: (context, cevap) {
                ogrenci = jsonDecode(cevap.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text("Okul no: ${ogrenci[index]['okulno']}"),
                            Text("Adı: " + ogrenci[index]['adi']),
                            Text("Soy Adı: " + ogrenci[index]['soyadi']),
                            Text("Cinsiyet: " + ogrenci[index]['cinsiyet']),
                            Text("Başarı : ${ogrenci[index]['basari']}"),
                            Text("Velisi: " + ogrenci[index]['veli']['yakinlik']),
                          ]),
                    );
                  },
                  itemCount: ogrenci == null ? 0 : ogrenci.length,
                );
              }),
        ),
      ),
    );
  }
}
