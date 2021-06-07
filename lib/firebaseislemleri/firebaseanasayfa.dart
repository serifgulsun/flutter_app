import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/item/ogrenci.dart';
import 'firebaseyardimci.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class FirebaseAnasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirebaseState();
}

class FirebaseState extends State<FirebaseAnasayfa> {
  FirebaseYardimcisi vt = new FirebaseYardimcisi();
  List<Ogrenci> ogrenciListesi = [];

  final formKontrolcusu = GlobalKey<FormState>();
  final isimCtrl = TextEditingController();
  final soyisimCtrl = TextEditingController();
  final sinifCtrl = TextEditingController();
  final noCtrl = TextEditingController();

  ogrenciEkle() {
    vt.ogrenciKaydet(Ogrenci(isimCtrl.text, soyisimCtrl.text, sinifCtrl.text));
        Navigator.pop(context);

        isimCtrl.clear();
        soyisimCtrl.clear();
        sinifCtrl.clear();
        //vt.ogrencileriGetir();
  }

  ogrenciGuncelle() {}
  ogrenciSil(Ogrenci ogr) {
    vt.ogrenciSil(ogr);
  }

  @override
  void initState() {
    super.initState();
    /*vt.ogrencileriGetir().then((deger) {
      ogrenciListesi = deger;
    }); */
    
      vt = FirebaseYardimcisi();
      vt.initSatate();
       isimCtrl.clear();
        soyisimCtrl.clear();
        sinifCtrl.clear();
  }

  void eklemeEkraniAc() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("öğrenci ekle"),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Form(
                  key: formKontrolcusu,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: isimCtrl,
                        decoration: InputDecoration(hintText: "isim"),
                      ),
                      TextFormField(
                        controller: soyisimCtrl,
                        decoration: InputDecoration(hintText: "soyisim"),
                      ),
                      TextFormField(
                        controller: sinifCtrl,
                        decoration: InputDecoration(hintText: "sınıf"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text("ekle"),
              onPressed: () => ogrenciEkle(),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text("iptal"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase işlemleri"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: () => eklemeEkraniAc(),
          ),
        ],
      ),
      // ignore: missing_required_param
      body: FirebaseAnimatedList(
        query: vt.ogrencileriGetir(),
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
          Ogrenci ogr = Ogrenci.fromDataSnapshot(snapshot);
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                      "${ogr.isim} ${ogr.soyisim}"),
                  leading: Text("${ogr.id.substring(4,7)}"),
                  subtitle: Text("${ogr.sinif}"),
                ),
                Row(
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: Text("güncelle"),
                      onPressed: () => ogrenciGuncelle(),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Text("sil"),
                      onPressed: () => ogrenciSil(ogr),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
