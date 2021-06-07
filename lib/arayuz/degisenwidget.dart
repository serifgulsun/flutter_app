import 'package:flutter/material.dart';

/* class DegisenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State full example",
      theme: new ThemeData(
        primaryColor: Colors.blueAccent.shade200,
      ),
      home: new HomePage(),
    );
  }
} */

class DegisenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<DegisenWidget> {
  int sayi = 0;

  void sayiArtir() {
    setState(() {
      sayi++;
    });
  }

  void sayiAzalt() {
    setState(() {
      sayi--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("statefull deneme"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
              child: Text("Sayı Artır"),
              onPressed: sayiArtir,
            ),
            Text(
              "Degişen sayı $sayi",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 20.0,
                  color: sayi < 0 ? Colors.red : Colors.green.shade400),
            ),
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                child: Text("Sayı azalt"),
                onPressed: sayiAzalt),
          ],
        ),
      ),
    );
  }
}
