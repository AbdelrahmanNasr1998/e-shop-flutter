import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class Lenovo extends StatefulWidget {
  State<StatefulWidget> createState(){
    return LenovoState();
  }
}
class LenovoState extends State<Lenovo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text("Lenovo"),
          centerTitle: true,
          // leading: Icon(Icons.ac_unit),
          // actions: [Icon(Icons.search)],
        ),
      );
  }
}