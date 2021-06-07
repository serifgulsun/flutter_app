
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class KayitIslemleri {
  // kayıt yolu
  Future<String> get dosyaYolu async {
    Directory konum = await getApplicationDocumentsDirectory();
  
    print(konum.path);
    return konum.path;
  }

// dosya oluşturma
  Future get yerelDosya async {
    final yol = await dosyaYolu;

    return new File( yol +"/yenidosya.txt");
  }

   // dosya yazma
  
   Future<File> dosyaYaz (String gIcerik) async {
    final dosya = await yerelDosya;

    return dosya.writeAsString(gIcerik);
  }

  // dosya okuma

  Future<String> get dosyaOku async {
    try {
      final dosya = await yerelDosya;
      String icerik = await dosya.readAsStringSync();
      return icerik;
    } catch (h) {
      print(h);
      return 'dosya oluşurken hata oluştu $h';
    }
  }

 
}

class DosyaIslemleri extends StatefulWidget{
  final KayitIslemleri kayitislemleri;

DosyaIslemleri({Key key, this.kayitislemleri}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DosyaSatate();

}

class DosyaSatate extends State<DosyaIslemleri>{

  final yaziCtrl = TextEditingController();
  String veri ="";

  Future<File> veriKaydet () async{
    setState(() {
      veri = yaziCtrl.text;
    });

    return widget.kayitislemleri.dosyaYaz(veri);
  }

  @override
  void initState(){
    super.initState();
      widget.kayitislemleri.dosyaOku.then((String deger) {
      setState(() {
        veri = deger;
      });
    });
  }

  void veriOku () {
    widget.kayitislemleri.dosyaOku.then((String deger){
      setState(() {
        veri= deger;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("dosya işlemleri"),),
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children:<Widget> [
          TextField(
            decoration: InputDecoration(hintText: "dosya yazmak istediğiniz yeri yazın"),
            controller: yaziCtrl,
          ),
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                            onPrimary: Colors.white, // foreground
                          ),
                        onPressed: () => veriKaydet(),
                        child: Text(
                          "Kaydet",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue, // background
                            onPrimary: Colors.limeAccent, // foreground
                          ),
                        onPressed: () => veriOku(),
                        child: Text(
                          "Oku",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("isim: $veri"),
                    ],
                  ),
                ),
              ),

      ],),

    );
  }

}