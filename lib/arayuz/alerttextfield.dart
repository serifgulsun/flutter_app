import 'package:flutter/material.dart';

class AlertTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlertState();
}

class AlertState extends State<AlertTextField> {
  final yaziKontrolcusu = TextEditingController();
  final genelKontrolcu = GlobalKey<FormState>();

  @override
  void dispose() {
    yaziKontrolcusu.dispose();
    super.dispose();
  }

  void selamla() {
    if (genelKontrolcu.currentState.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("selamla metnimiz"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("merhaba ${yaziKontrolcusu.text}"),
                  Text("hoş geldiniz"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                 style: TextButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                child: Text("tamam"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("alert ve textfield"),
      ),
      body: Form(
        key: genelKontrolcu,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                // ignore: missing_return
                validator: (yazi) {
                  if (yazi.isEmpty) {
                    return "lütfen alanı doldurunuz";
                  }
                },
                controller: yaziKontrolcusu,
                decoration: InputDecoration(hintText: "isminizi giriniz"),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: selamla,
                  child: Text(
                    "selamla",
                    style: TextStyle(color: Colors.red),
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
