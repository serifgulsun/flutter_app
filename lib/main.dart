import 'package:flutter/material.dart';
import 'package:flutter_application/arayuz/alerttextfield.dart';
import 'package:flutter_application/arayuz/basithttp.dart';
import 'package:flutter_application/arayuz/degisenwidget.dart';
import 'package:flutter_application/arayuz/dosyaislemleri.dart';
import 'package:flutter_application/arayuz/hello.dart';
import 'package:flutter_application/arayuz/ilkSayfa.dart';
import 'package:flutter_application/arayuz/imagesview.dart';
import 'package:flutter_application/arayuz/jsonkonusu.dart';
//import 'package:flutter_application/arayuz/hello.dart';
import 'package:flutter_application/arayuz/scaffoldSample.dart';
import 'package:flutter_application/arayuz/sharedkonusu.dart';
import 'package:flutter_application/firebaseislemleri/firebaseanasayfa.dart';
import 'package:flutter_application/sayfalar/appbarsayfasi.dart';
import 'package:flutter_application/veritabani/vtanasayfa.dart';

import 'arayuz/localjsonkonusu.dart';

main() {
  /* runApp(
    new MaterialApp(title: "mer", home: new ScaffoldSample()),
  ); */

  //runApp(new DegisenWidget());

  runApp(new MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => ScaffoldSample(),
      "/hello": (context) => Hello(),
      "/ilkSayfa": (context) => IlkSayfa(title: "ilk sayfa"),
      "/degisenwidget": (context) => DegisenWidget(),
      "/imagesview": (context) => ImagesView(),
      "/alerttextfield": (context) => AlertTextField(),
      "/sharedkonusu": (context) => SharedKonusu(),
      "/dosyaislemleri": (context) => DosyaIslemleri(kayitislemleri: KayitIslemleri()),
      "/jsonkonusu": (context) => JsonKonusu(),
      "/localjsonkonusu": (context) => LocalJsonKonusu(),
      "/basithttp": (context) => BasitHttpKonusu(),
      "/vtanasayfa": (context) => VtAnasayfa(),
      "/appbarsayfasi": (context) => AppBarSayfasi(),
      "/firebaseanasayfa": (context) => FirebaseAnasayfa(),
      
    },
   /* theme:  ThemeData(
      fontFamily: "FreckleFace-Regular",
    ), */
  ));
}
