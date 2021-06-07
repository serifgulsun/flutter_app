import 'package:firebase_database/firebase_database.dart';

class Ogrenci {
  int no;
  String id;
  String _isim;
  String _soyisim;
  String _sinif;

  get isim => this._isim;
  set isim(value) => this._isim = value;

  get soyisim => this._soyisim;
  set soyisim(value) => this._soyisim = value;

  get sinif => this._sinif;
  set sinif(value) => this._sinif = value;

  Ogrenci(this._isim, this._soyisim, this._sinif, {this.id});

  Ogrenci.map(dynamic nesne) {
    this._isim = nesne["isim"];
    this._soyisim = nesne["soyisim"];
    this._sinif = nesne["sinif"];
  }

  Map<String, dynamic> haritaYap() {
    var map = new Map<String, dynamic>();
    map["isim"] = _isim;
    map["soyisim"] = _soyisim;
    map["sinif"] = _sinif;

    return map;
  }

  void numaraVer(int no) {
    this.no = no;
  }

  Ogrenci.fromDataSnapshot(DataSnapshot gelen) {
    try {
      id = gelen.key;
      _isim = gelen.value['isim'];
      _sinif = gelen.value['sinif'];
      _soyisim = gelen.value['soyisim'];
    } on Exception catch (e) {
      print("snaphot hatası $e");
    }
  }
}
