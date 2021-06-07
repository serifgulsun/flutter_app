import 'package:flutter/material.dart';

class BilgilendirmeSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: YaziHareketi(),
    );
  }
}

class YaziHareketi extends StatefulWidget {
  @override
  _YaziHareketiState createState() => _YaziHareketiState();
}

class _YaziHareketiState extends State<YaziHareketi>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animasyon;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animasyon = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)
      ..addListener(
        () => this.setState(() {}),
      )
      ..addStatusListener((durum) {});
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "bilgilendirme",
        style: TextStyle(fontSize: animasyon.value * 20),
      ),
    );
  }
}
