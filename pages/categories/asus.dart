import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../components/dlist.dart';

class Asus extends StatefulWidget {
  State<StatefulWidget> createState(){
    return AsusState();
  }
}
class AsusState extends State<Asus> {

  Future getData() async {
    var url = "http://10.0.2.2/dlist/index.php";
    var data = {"cat":"1"};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text("Asus"),
          centerTitle: true,
          // leading: Icon(Icons.ac_unit),
          // actions: [Icon(Icons.search)],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i){
                  return DList(name: snapshot.data[i]['name'],image: snapshot.data[i]['image'], model: snapshot.data[i]['model'], display: snapshot.data[i]['display'], cpu: snapshot.data[i]['cpu'], cores: snapshot.data[i]['cores'], threads: snapshot.data[i]['threads'], gpu: snapshot.data[i]['gpu'], gpu_vram: snapshot.data[i]['gpu_vram'], ram: snapshot.data[i]['ram'], ssd: snapshot.data[i]['ssd'], hdd: snapshot.data[i]['hdd'], battery: snapshot.data[i]['battery'], os: snapshot.data[i]['os'], body_material: snapshot.data[i]['body_material'], dimensions: snapshot.data[i]['dimensions'], weight: snapshot.data[i]['weight'], usb: snapshot.data[i]['usb'], hdmi: snapshot.data[i]['hdmi'], vga: snapshot.data[i]['vga'], card_reader: snapshot.data[i]['card_reader'], ethernet_lan: snapshot.data[i]['ethernet_lan'], wi_fi: snapshot.data[i]['wi_fi'], bluetooth: snapshot.data[i]['bluetooth'], audio_jack: snapshot.data[i]['audio_jack'], web_camera: snapshot.data[i]['web_camera'], microphone: snapshot.data[i]['microphone'], speakers: snapshot.data[i]['speakers'], dollar: snapshot.data[i]['dollar'], euro: snapshot.data[i]['euro'], pro_cat: snapshot.data[i]['pro_cat']);
                },
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      );
  }
}

