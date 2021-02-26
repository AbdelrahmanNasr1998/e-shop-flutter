
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_course_project/components/dlist.dart';
import '../components/drawer.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  State<StatefulWidget> createState(){
    return HomeState();
  }
}
class HomeState extends State<Home> {
  var listsearch = [];
  Future getData() async{
    var url = "http://10.0.2.2/dlist/search.php";
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    for(int i = 0 ; i < responsebody.length ; i++) {
      listsearch.add(responsebody[i]['name']);
    }
    print(listsearch);
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text("E-Commerce"),
          centerTitle: true,
          // leading: Icon(Icons.ac_unit),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: DataSearch(list: listsearch));
              },
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Carousel(
                images: [
                  Image.asset('assets/images/1.png' , fit: BoxFit.cover,),
                  Image.asset('assets/images/2.jpg' , fit: BoxFit.cover,),
                  Image.asset('assets/images/3.jpg' , fit: BoxFit.cover,),
                ],
              dotIncreasedColor: Colors.red[900],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Categories" , style: TextStyle(color: Colors.red[900],fontSize: 30),),
              ),
            Container(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: ListTile(
                      title: Image.asset('assets/images/4.png', width: 80, height: 80,),
                      subtitle: Container(child: Text("ROG",textAlign: TextAlign.center,),),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: ListTile(
                      title: Image.asset('assets/images/5.png', width: 80, height: 80,),
                      subtitle: Container(child: Text("RAZER",textAlign: TextAlign.center,),),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: ListTile(
                      title: Image.asset('assets/images/6.png', width: 80, height: 80,),
                      subtitle: Container(child: Text("PREDATOR",textAlign: TextAlign.center,),),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: ListTile(
                      title: Image.asset('assets/images/7.jpg', width: 80, height: 80,),
                      subtitle: Container(child: Text("ALIENWARE",textAlign: TextAlign.center,),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Products" , style: TextStyle(color: Colors.red[900],fontSize: 30),),
              ),
            Container(
              height: 400,
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: <Widget>[
                  InkWell(child:GridTile(child: Image.asset("assets/images/8.jpg"),footer: Container(height: 20,color: Colors.black.withOpacity(.5),child: Text("ROG LapTop",style: TextStyle(color: Colors.white) ,textAlign: TextAlign.center,)),),onTap: (){},),
                  InkWell(child:GridTile(child: Image.asset("assets/images/9.jpg"),footer: Container(height: 20,color: Colors.black.withOpacity(.5),child: Text("RAZER LapTop",style: TextStyle(color: Colors.white) ,textAlign: TextAlign.center,)),),onTap: (){},),
                  InkWell(child:GridTile(child: Image.asset("assets/images/10.jpg"),footer: Container(height: 20,color: Colors.black.withOpacity(.5),child: Text("PREDATOR LapTop",style: TextStyle(color: Colors.white) ,textAlign: TextAlign.center,)),),onTap: (){},),
                  InkWell(child:GridTile(child: Image.asset("assets/images/11.jpg"),footer: Container(height: 20,color: Colors.black.withOpacity(.5),child: Text("ALIENWARE LapTop",style: TextStyle(color: Colors.white) ,textAlign: TextAlign.center,)),),onTap: (){},),
                ],
              ),
            ),
          ],
        ),
      );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;
  DataSearch({this.list});
    Future getSearchData() async{
      var url = "http://10.0.2.2/dlist/searchpro.php";
      var data = {"search" : query};
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      return responsebody;
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          query = "";
        }
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back), 
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: getSearchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context , i){
              return DList(name: snapshot.data[i]['name'],image: snapshot.data[i]['image'], model: snapshot.data[i]['model'], display: snapshot.data[i]['display'], cpu: snapshot.data[i]['cpu'], cores: snapshot.data[i]['cores'], threads: snapshot.data[i]['threads'], gpu: snapshot.data[i]['gpu'], gpu_vram: snapshot.data[i]['gpu_vram'], ram: snapshot.data[i]['ram'], ssd: snapshot.data[i]['ssd'], hdd: snapshot.data[i]['hdd'], battery: snapshot.data[i]['battery'], os: snapshot.data[i]['os'], body_material: snapshot.data[i]['body_material'], dimensions: snapshot.data[i]['dimensions'], weight: snapshot.data[i]['weight'], usb: snapshot.data[i]['usb'], hdmi: snapshot.data[i]['hdmi'], vga: snapshot.data[i]['vga'], card_reader: snapshot.data[i]['card_reader'], ethernet_lan: snapshot.data[i]['ethernet_lan'], wi_fi: snapshot.data[i]['wi_fi'], bluetooth: snapshot.data[i]['bluetooth'], audio_jack: snapshot.data[i]['audio_jack'], web_camera: snapshot.data[i]['web_camera'], microphone: snapshot.data[i]['microphone'], speakers: snapshot.data[i]['speakers'], dollar: snapshot.data[i]['dollar'], euro: snapshot.data[i]['euro'], pro_cat: snapshot.data[i]['pro_cat']);
            }
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist = query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemCount: searchlist.length,
      itemBuilder: (context , i){
        return ListTile(
          leading: Icon(Icons.search),
          title: Text(searchlist[i]),
          onTap: (){
            query = searchlist[i];
            showResults(context);
          },
        );
      }
    );
  }

}