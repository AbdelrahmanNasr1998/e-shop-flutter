import 'package:flutter/material.dart';
import '../pages/details.dart';

class DList extends StatelessWidget {
  final name;
  final image;
  final model;
  final display;
  final cpu;
  final cores;
  final threads;
  final gpu;
  final gpu_vram;
  final ram;
  final ssd;
  final hdd;
  final battery;
  final os;
  final body_material;
  final dimensions;
  final weight;
  final usb;
  final hdmi;
  final vga;
  final card_reader;
  final ethernet_lan;
  final wi_fi;
  final bluetooth;
  final audio_jack;
  final web_camera;
  final microphone;
  final speakers;
  final dollar;
  final euro;
  final pro_cat;

  DList({this.name,this.image,this.model,this.display,this.cpu,this.cores,this.threads,this.gpu,this.gpu_vram,this.ram,this.ssd,this.hdd,this.battery,this.os,this.body_material,this.dimensions,this.weight,this.usb,this.hdmi,this.vga,this.card_reader,this.ethernet_lan,this.wi_fi,this.bluetooth,this.audio_jack,this.web_camera,this.microphone,this.speakers,this.dollar,this.euro,this.pro_cat});
  @override
  Widget build(BuildContext context) {
    return InkWell(
              child: Container(
              height: 100,
              width: 100,
              child: Card(
                child: Row(
                  children: <Widget>[
                    Expanded(flex: 1 ,child: Image.asset("assets/images/4.png")),
                    Expanded(flex: 2 ,child: Container(alignment: Alignment.topLeft ,height: 100, child: 
                    Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Row(children: <Widget>[
                          // Text("name: ", style: TextStyle(color: Colors.red[900],fontWeight: FontWeight.w900),),
                          Text(name, style: TextStyle(color: Colors.red[900],fontWeight: FontWeight.w900)),
                        ],)),
                        Expanded(child: Row(children: <Widget>[
                          // Text("CPU: "),
                          Text(cpu),
                        ],)),
                        Expanded(child: Row(children: <Widget>[
                          // Text("GPU: "),
                          Text(gpu),
                        ],)),
                        Expanded(child: Row(children: <Widget>[
                          // Text("RAM: "),
                          Text(ram),
                        ],)),
                        
                        Container(margin: EdgeInsets.only(top:5),child: Text("${dollar}"+" \$", style: TextStyle(fontWeight: FontWeight.w900),),),
                    ],),),),
                  ],
                ),
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Details(name_d:name,image_d:image,model_d:model,display_d:display,cpu_d:cpu,cores_d:cores,threads_d:threads,gpu_d:gpu,gpu_vram_d:gpu_vram,ram_d:ram,ssd_d:ssd,hdd_d:hdd,battery_d:battery,os_d:os,body_material_d:body_material,dimensions_d:dimensions,weight_d:weight,usb_d:usb,hdmi_d:hdmi,vga_d:vga,card_reader_d:card_reader,ethernet_lan_d:ethernet_lan,wi_fi_d:wi_fi,bluetooth_d:bluetooth,audio_jack_d:audio_jack,web_camera_d:web_camera,microphone_d: microphone,speakers_d:speakers,dollar_d:dollar,euro_d:euro,pro_cat_d:pro_cat);
              }));
            },
            );
  }
}