import 'package:flutter/material.dart';
import 'package:flutter_application/item/ogrenci.dart';
import 'package:flutter_application/veritabani/vtyardimci.dart';

class VtAnasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VtState();
}

class VtState extends State<VtAnasayfa> {
  VtYardimcisi vt = new VtYardimcisi();
  List<Ogrenci> ogrenciListesi = [];

  final formKontrolcusu = GlobalKey<FormState>();
  final isimCtrl = TextEditingController();
  final soyisimCtrl = TextEditingController();
  final sinifCtrl = TextEditingController();
  final noCtrl = TextEditingController();

  ogrenciEkle() {
    vt.ogrenciKaydet(new Ogrenci(isimCtrl.text, soyisimCtrl.text, sinifCtrl.text)).then((deger) {
      print("database hatası " +deger.toString());
       if (deger > 0) {
        setState(() {
          vt.ogrencileriGetir().then((deger) {
            ogrenciListesi = deger;
          });
        });
        Navigator.pop(context);

        isimCtrl.clear();
        soyisimCtrl.clear();
        sinifCtrl.clear();
      }
    });
  }

  ogrenciGuncelle() {}
  ogrenciSil() {}

  @override
  void initState() {
    super.initState();
    vt.ogrencileriGetir().then((deger) {
      ogrenciListesi = deger;
    }); 

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
        title: Hero(tag: "veritabani", child:Text("veri tabanı işlemleri"),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: () => eklemeEkraniAc(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ogrenciListesi.length,
        itemBuilder: (BuildContext baglam, int sira) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                      "${ogrenciListesi[sira].isim} ${ogrenciListesi[sira].soyisim}"),
                  leading: Text("${ogrenciListesi[sira].no}"),
                  subtitle: Text("${ogrenciListesi[sira].sinif}"),
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
                      onPressed: () => ogrenciSil(),
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
