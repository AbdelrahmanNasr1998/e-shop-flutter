import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  State<StatefulWidget> createState(){
    return CategoriesState();
  }
}
class CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text("Categories"),
          centerTitle: true,
          // leading: Icon(Icons.ac_unit),
          // actions: [Icon(Icons.search)],
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Image.asset("assets/images/12.png"),),
                      Container(child: Text("data", style: TextStyle(fontSize: 20),),)
                    ],
                  ),
                ),
              ),
            onTap: (){
              Navigator.of(context).pushNamed("asus");
            },
            ),
            InkWell(
              child:Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Image.asset("assets/images/13.png"),),
                      Container(child: Text("data", style: TextStyle(fontSize: 20),),)
                    ],
                  ),
                ),
              ), 
            onTap: (){
              Navigator.of(context).pushNamed("razer");
            },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Image.asset("assets/images/14.jpg"),),
                      Container(child: Text("data", style: TextStyle(fontSize: 20),),)
                    ],
                  ),
                ),
              ),
            onTap: (){
              Navigator.of(context).pushNamed("acer");
            },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Image.asset("assets/images/15.jpg"),),
                      Container(child: Text("data", style: TextStyle(fontSize: 20),),)
                    ],
                  ),
                ),
              ),
            onTap: (){
              Navigator.of(context).pushNamed("apple");
            },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Image.asset("assets/images/16.jpg"),),
                      Container(child: Text("data", style: TextStyle(fontSize: 20),),)
                    ],
                  ),
                ),
              ),
            onTap: (){
              Navigator.of(context).pushNamed("hp");
            },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Image.asset("assets/images/17.png"),),
                      Container(child: Text("data", style: TextStyle(fontSize: 20),),)
                    ],
                  ),
                ),
              ),
            onTap: (){
              Navigator.of(context).pushNamed("lenovo");
            },
            ), 
          ],
        ),
      );
  }
}