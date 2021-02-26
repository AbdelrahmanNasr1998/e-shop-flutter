import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class Apple extends StatefulWidget {
  State<StatefulWidget> createState(){
    return AppleState();
  }
}
class AppleState extends State<Apple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text("Apple"),
          centerTitle: true,
          // leading: Icon(Icons.ac_unit),
          // actions: [Icon(Icons.search)],
        ),
      );
  }
}