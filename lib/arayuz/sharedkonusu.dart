import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SharedKonusu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SharedState();
}

class SharedState extends State<SharedKonusu> {
  final isimCtrl = TextEditingController();
  final soyisimCtrl = TextEditingController();
  final genelCtrl = GlobalKey<FormState>();

  String isim = "";
  String soyisim = "";
  bool kayitDurumu = false;
  int kayitNo = 0;

  @override
  void dispose() {
    isimCtrl.dispose();
    soyisimCtrl.dispose();
    super.dispose();
  }

  void kaydet(String gIsim, String gSoyisim) async {
    final kayitAraci = await SharedPreferences.getInstance();

    if (genelCtrl.currentState.validate()) {
      kayitAraci.setBool("Durum", true);
      kayitAraci.setInt("KayitNo", 1);
      kayitAraci.setString("Isim", gIsim);
      kayitAraci.setString("SoyIsim", gSoyisim);

      Fluttertoast.showToast(
        msg: "kayıt başarılı",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
      );
    }
  }

  void getir() async {
    final kayitAraci = await SharedPreferences.getInstance();

    setState(() {
      isim = kayitAraci.getString("Isim");
      soyisim = kayitAraci.getString("SoyIsim");
      kayitDurumu = kayitAraci.getBool("Durum");
      kayitNo = kayitAraci.getInt("KayitNo");
    });

      Fluttertoast.showToast(
        msg: "veriler gösterildi",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
      );
  }

  void sil() async{
   final kayitAraci = await SharedPreferences.getInstance();

   kayitAraci.clear(); // hepsini birden siler
   //kayitAraci.remove("Isim"); // sadece istenilen alanı siler
    Fluttertoast.showToast(
        msg: "silme işlemi  başarılı",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
      );

      getir();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shared reference"),
      ),
      body: Form(
        key: genelCtrl,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                // ignore: missing_return
                validator: (yazi){
                  if (yazi.isEmpty) {
                    return "lütfen alanı doldurunuz";
                  }
                },
                controller: isimCtrl,
                decoration: InputDecoration(hintText: "isminizi giriniz"),
              ),
              TextFormField(
                // ignore: missing_return
                validator: (yazi){
                  if (yazi.isEmpty) {
                    return "lütfen alanı doldurunuz";
                  }
                },
                controller: soyisimCtrl,
                decoration: InputDecoration(hintText: "soyisim  giriniz"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent, // background
                            onPrimary: Colors.white, // foreground
                          ),
                        onPressed: () =>
                            kaydet(isimCtrl.text, soyisimCtrl.text),
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
                            primary: Colors.blueAccent, // background
                            onPrimary: Colors.white, // foreground
                          ),
                        onPressed: getir,                     
                        child: Text(
                          "Getir",
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
                            primary: Colors.orangeAccent, // background
                            onPrimary: Colors.white, // foreground
                          ),
                        onPressed: sil,
                        child: Text(
                          "Sil",
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
                      Text("isim: $isim"),
                      Text("soyisim: $soyisim"),
                      Text("kayıt durumu: $kayitDurumu"),
                      Text("kayıt numarası: $kayitNo"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
