import 'package:firebase_database/firebase_database.dart';
//import 'dart:async';
import 'package:flutter_application/item/ogrenci.dart';


class FirebaseYardimcisi {
  DatabaseReference vtReferans;
  //StreamSubscription<Event> veritabaniakisi;
  FirebaseDatabase veritabani = new FirebaseDatabase();
  DatabaseError hata;

  static final FirebaseYardimcisi _firebaseYardimci =
      new FirebaseYardimcisi.icislem();
  FirebaseYardimcisi.icislem();
  factory FirebaseYardimcisi() {
    return _firebaseYardimci;
  }

  void initSatate() {
    vtReferans = veritabani.reference().child("ogrenciler");
  }

  ogrenciKaydet(Ogrenci ogr) {
    vtReferans.push().set(<String, String>{
      'isim': ogr.isim,
      'soyisim': ogr.soyisim,
      'sinif': ogr.sinif,
    }).then((value){
      print("firebase ekleme gerçekleşti ");
    }).catchError((onError){
      print("firebase ekleme hatası $onError");
    });
  }

 ogrenciSil (Ogrenci ogr){
   vtReferans.child(ogr.id).remove().then((value){
      print("firebase silme gerçekleşti ");
    }).catchError((onError){
      print("firebase silme hatası $onError");
    });
 }
  ogrencileriGetir(){
    return vtReferans;
  }
}
