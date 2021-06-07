import 'package:flutter/material.dart';
import 'package:flutter_application/widgetlar/ana_card.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ArsivSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        AnaCard("/firebaseanasayfa", "resim.jpg", "firebase anasayfa"),
        AnaCard("/appbarsayfasi", "resim.jpg", "app bar sayfası"),
        Hero(tag: "veritabani",
        child:AnaCard("/vtanasayfa", "resim.jpg", "veri tabanı") ,),
        
        AnaCard("/basithttp", "resim.jpg", "basit "),
        AnaCard("/ilkSayfa", "resim.jpg", "ilk sayfa"),
        AnaCard("/imagesview", "resim.jpg", "images view"),
        AnaCard("/degisenwidget", "resim.jpg", "degisen widget"),
        AnaCard("/hello", "resim.jpg", "hello double"),
        AnaCard("/alerttextfield", "resim.jpg", "alert textfield"),
        AnaCard("/sharedkonusu", "resim.jpg", "shared konusu"),
        AnaCard("/dosyaislemleri", "resim.jpg", "dosya işlemleri"),
        new GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
              msg: "uyarı mesajı",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          onDoubleTap: () {
            Fluttertoast.showToast(
              msg: "uyarı mesajı uzun",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.asset('assets/images/resim.jpg'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'toast mesajı',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ),
        ),
        new GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/jsonkonusu"),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.asset('assets/images/resim.jpg'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'json konusu',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ),
        ),
        new GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/localjsonkonusu"),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI"),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 8,
                ),
              ),
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text(" local json konusu"),
              //color: Colors.teal[100],
            )),
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text('Who scream'),
          color: Colors.teal[400],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text('Revolution is coming...'),
          color: Colors.teal[500],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text('Revolution, they...'),
          color: Colors.teal[600],
        ),
      ],
    ));
  }
}
