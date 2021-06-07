import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as baglanti;
import 'dart:convert';

/*
userId: 1,
id: 1,
title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
body:
*/
class Post {
  int userId;
  int id;
  String title;
  String body;
  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"]);
  }
}

Future<Post> postuGetir() async {
  final cevap =
      await baglanti.get('https://jsonplaceholder.typicode.com/posts/1');
  if (cevap.statusCode == 200) {
    return Post.fromJson(json.decode(cevap.body));
  } else {
    throw Exception("jsonda hata alındı");
  }
}

class JsonKonusu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("json konusu"),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: postuGetir(),
          builder: (context, verileriAl) {
            if (verileriAl.hasData) {
             /* 
              int userId = verileriAl.data.userId;
              int id = verileriAl.data.id;
              String title = verileriAl.data.title;
              String body = verileriAl.data.body;
              */
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("user id: ${verileriAl.data.userId}"),
                  Text(" id: ${verileriAl.data.id}"),
                  Text("title: ${verileriAl.data.title}"),
                  Text("body: ${verileriAl.data.body}"),
                ],
              );
            } else if (verileriAl.hasError) {
              return Text("hata ${verileriAl.hasError}");
            }
            return CircularProgressIndicator();
            // deneme denemem
          },
        ),
      ),
    );
  }
}
