import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class Acer extends StatefulWidget {
  State<StatefulWidget> createState(){
    return AcerState();
  }
}
class AcerState extends State<Acer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text("Acer"),
          centerTitle: true,
          // leading: Icon(Icons.ac_unit),
          // actions: [Icon(Icons.search)],
        ),
      );
  }
}