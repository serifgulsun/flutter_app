import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter_application/item/ogrenci.dart';

class VtYardimcisi {
  static final _yardimci = new VtYardimcisi.icislem();
  factory VtYardimcisi() => _yardimci;
  VtYardimcisi.icislem();
  static Database _db;

  Future<Database> get veritabani async {
    if (_db != null) return _db;
    _db = await vtOlustur();
    return _db;
  }

  vtOlustur() async {
    io.Directory dosyaKonumu = await getApplicationDocumentsDirectory();
    String yol = join(dosyaKonumu.path, "ogrenciler.db");
    var veriTb = openDatabase(yol, version: 1, onCreate: _ilkAcilis);
    return veriTb;
  }

  _ilkAcilis(Database db, int versiyon) async {
    await db.execute("CREATE TABLE ogrenci( no INTEGER PRIMARY KEY AUTOINCREMENT, isim TEXT, soyisim TEXT, sinif TEXT)");
  }

  Future<int> ogrenciKaydet(Ogrenci ogrenci) async {
    var veritab = await veritabani;
    int cevap = await veritab.insert("ogrenci", ogrenci.haritaYap());

    return cevap;
  }

  Future<List<Ogrenci>> ogrencileriGetir() async {
    var ver = await veritabani;
    List<Map> liste = await ver.rawQuery("select * from ogrenci");
    List<Ogrenci> ogrenciler = [];

    for (int i = 0; i < liste.length; i++) {
      var ogrenci =
          new Ogrenci(liste[i]["isim"], liste[i]["soyisim"], liste[i]["sinif"]);
      ogrenci.numaraVer(liste[i]["no"]);
      ogrenciler.add(ogrenci);
    }

    return ogrenciler;
  }

  Future<int> ogrenciSil(Ogrenci ogrenci) async {
    var vt = await veritabani;
    int cevap =
        await vt.rawDelete("delete from ogrenci where no = ?", [ogrenci.no]);
    return cevap;
  }

  // ignore: non_constant_identifier_names
  Future<bool> ogrenciGuncelle(Ogrenci, ogrenci) async {
    var vt = await veritabani;
    int cevap = await vt.update("ogrenci", ogrenci.haritaYap(),
        where: "no = ? ", whereArgs: <int>[ogrenci.no]);

    return cevap > 0 ? true : false;
  }
}
