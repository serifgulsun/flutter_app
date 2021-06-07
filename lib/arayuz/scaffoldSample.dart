import 'package:flutter/material.dart';
import 'package:flutter_application/sayfalar/appbarsayfasi.dart';
import 'package:flutter_application/sayfalar/arsiv.dart';
import 'package:flutter_application/sayfalar/bilgilendirme.dart';
import 'package:flutter_application/sayfalar/degerlendirme.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ScaffoldSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScaffoldStatemiz();
}

class ScaffoldStatemiz extends State<ScaffoldSample> {
  GlobalKey<ScaffoldState> _keyScaffold = new GlobalKey<ScaffoldState>();
  int aktifOge = 0;
  gecerliSayfa(int aktif) {
    switch (aktif) {
      case 0:
        return ArsivSayfasi();
        break;
      case 1:
        return BilgilendirmeSayfasi();
        break;
      case 2:
        return DegerlendirmeSayfasi();
        break;
      default:
        return ArsivSayfasi();
        break;
    }
  }

  void ornekFonksiyon(int i) {

     Fluttertoast.showToast(
        msg: "silme işlemi  başarılı $i",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
      );
  }

  void ornekBottomSheet() {
    _keyScaffold.currentState.showBottomSheet((BuildContext ctc) {
      return Container(
        height: 250,
        color: Colors.redAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () => Navigator.pop(context),
            ),
            Divider(
              height: 2,
              color: Colors.blueAccent,
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            Divider(
              height: 2,
              color: Colors.blueAccent,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            Divider(
              height: 2,
              color: Colors.blueAccent,
            ),
            ExpansionTile(
              leading: Icon(Icons.settings),
              title: Text('Hakkımızda'),
              trailing: Icon(Icons.arrow_right),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
                Divider(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Divider(
                  height: 2,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _keyScaffold,
      backgroundColor: Colors.cyan.shade100,
      appBar: new AppBar(
        title: Text('AppBar Demo'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (secilen) {
                switch (secilen) {
                  case 0:
                    print("deneme popup ${secilen.toString()}");
                    ornekFonksiyon(secilen);
                    break;
                  case 1:
                    print("deneme popup ${secilen.toString()}");
                    ornekFonksiyon(secilen);
                    break;
                  case 2:
                    print("deneme popup ${secilen.toString()}");
                    ornekFonksiyon(secilen);
                    break;
                  default:
                    print("deneme popup ${secilen.toString()}");
                    ornekFonksiyon(secilen);
                    break;
                }
              },
              icon: Icon(Icons.add_alert),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    value: 0,
                    child: ListTile(
                      title: Text("deneme 0"),
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: ListTile(
                      title: Text("deneme 1"),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: ListTile(
                      title: Text("deneme 2"),
                    ),
                  ),
                ];
              }),
          IconButton(
            icon: Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () => ornekBottomSheet(),
            // onPressed: () => Navigator.pushNamed(context, "/ilkSayfa"),
          ),
          IconButton(
            icon: Icon(Icons.mail),
            tooltip: 'Next page',
            onPressed: () => print("deneme 2"),
          ),
        ],
      ),
      body: gecerliSayfa(aktifOge),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting, // ayarlar

        currentIndex: aktifOge,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Bilgilendirme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Değerlendirme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'deneme 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'deneme 2',
          ),
        ],
        onTap: (int i) {
          aktifOge = i;
          setState(() {});
        },
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () => Navigator.pop(context),
            ),
            Divider(
              height: 2,
              color: Colors.blueAccent,
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('App bar sayfasına git'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return AppBarSayfasi(gelenDeger: "draw menu den geldim",);
                }),
                );
              },
            ),
            Divider(
              height: 2,
              color: Colors.blueAccent,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            Divider(
              height: 2,
              color: Colors.blueAccent,
            ),
            ExpansionTile(
              leading: Icon(Icons.settings),
              title: Text('Hakkımızda'),
              trailing: Icon(Icons.arrow_right),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
                Divider(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Divider(
                  height: 2,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
