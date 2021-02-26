import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class Hp extends StatefulWidget {
  State<StatefulWidget> createState(){
    return HpState();
  }
}
class HpState extends State<Hp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text("Hp"),
          centerTitle: true,
          // leading: Icon(Icons.ac_unit),
          // actions: [Icon(Icons.search)],
        ),
      );
  }
}