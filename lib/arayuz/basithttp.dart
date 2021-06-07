import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BasitHttpKonusu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HttpState();
}

class HttpState extends State<BasitHttpKonusu> {
  var veri = "";
  void getMetodu() {
    http.get("https://jsonplaceholder.typicode.com/posts/1").then((cevap) {
      setState(() {
        veri = cevap.body;
      });
    });
  }

  void postMetodu() {
    http.post("https://jsonplaceholder.typicode.com/posts", body: {
      "title": "şerif gülsün uygulaması",
      "body": "şerif gülsün' ün uygulama denemleri için vermiş olduğu mücadele taktire şayan",
      "userId": "21"
    }).then((cevap) {
      setState(() {
        veri = cevap.body;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("basit http konusu"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () => getMetodu(),
                    child: Text(
                      "Get",
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
                      primary: Colors.blue, // background
                      onPrimary: Colors.limeAccent, // foreground
                    ),
                    onPressed: () => postMetodu(),
                    child: Text(
                      "Post",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
                child: ListView(
              children: <Widget>[
                Text("Gelen veriler $veri"),
              ],
            )),
          )
        ],
      ),
    );
  }
}
