import 'package:flutter/material.dart';
import '../components/dlist.dart';

class Details extends StatefulWidget {
  
  final name_d;
  final image_d;
  final model_d;
  final display_d;
  final cpu_d;
  final cores_d;
  final threads_d;
  final gpu_d;
  final gpu_vram_d;
  final ram_d;
  final ssd_d;
  final hdd_d;
  final battery_d;
  final os_d;
  final body_material_d;
  final dimensions_d;
  final weight_d;
  final usb_d;
  final hdmi_d;
  final vga_d;
  final card_reader_d;
  final ethernet_lan_d;
  final wi_fi_d;
  final bluetooth_d;
  final audio_jack_d;
  final web_camera_d;
  final microphone_d;
  final speakers_d;
  final dollar_d;
  final euro_d;
  final pro_cat_d;

  Details({this.name_d,this.image_d,this.model_d,this.display_d,this.cpu_d,this.cores_d,this.threads_d,this.gpu_d,this.gpu_vram_d,this.ram_d,this.ssd_d,this.hdd_d,this.battery_d,this.os_d,this.body_material_d,this.dimensions_d,this.weight_d,this.usb_d,this.hdmi_d,this.vga_d,this.card_reader_d,this.ethernet_lan_d,this.wi_fi_d,this.bluetooth_d,this.audio_jack_d,this.web_camera_d,this.microphone_d,this.speakers_d,this.dollar_d,this.euro_d,this.pro_cat_d});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[900],
            title: Text('Details'),
            centerTitle: true,
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: 300,
                child: GridTile(
                  child: Image.asset("assets/images/4.png"),
                  footer: Container(
                      height: 80,
                      color: Colors.black.withOpacity(0.3),
                      child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            //  mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  widget.model_d,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "${widget.dollar_d}\$",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ),
              ),
              // End Header Page
              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        "Specification" ,
                        style: TextStyle(fontSize: 25), textAlign: TextAlign.center ,
                      )),
                    ],
                  )),
              // Start Column Spesfiaction
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    mySpec(context ,  "Name: " , widget.name_d   ,  Colors.red[900] , Colors.white)  , 
                    mySpec(context ,  "Model: " , widget.model_d   ,  Colors.white , Colors.red[900])  , 
                    mySpec(context ,  "Display: " , widget.display_d   , Colors.red[900] , Colors.white)  , 
                    mySpec(context ,  "CPU: " , widget.cpu_d   ,  Colors.white , Colors.red[900])  , 
                    mySpec(context ,  "Cores: " , widget.cores_d   ,  Colors.red[900] , Colors.white)  , 
                    mySpec(context ,  "Threads: " , widget.threads_d  ,  Colors.white , Colors.red[900])  , 
                    mySpec(context ,  "GPU: " , widget.gpu_d   , Colors.red[900] , Colors.white)  , 
                    mySpec(context ,  "RAM: " , widget.ram_d   ,  Colors.white , Colors.red[900])  , 
                    mySpec(context ,  "SSD: " , widget.ssd_d ,  Colors.red[900] , Colors.white)  , 
                    mySpec(context ,  "HDD: " , widget.hdd_d  ,  Colors.white , Colors.red[900])  ,
                    mySpec(context ,  "Battery: " , widget.battery_d  ,   Colors.red[900] , Colors.white)  , 
                    mySpec(context ,  "OS: " , widget.os_d   , Colors.white , Colors.red[900])  , 
                    mySpec(context ,  "Body Material: " , widget.body_material_d   ,  Colors.red[900] , Colors.white)  , 
                    mySpec(context ,  "Dimensions: " , widget.dimensions_d   ,  Colors.white , Colors.red[900])  , 
                    mySpec(context ,  "Weight: " , widget.weight_d  ,  Colors.red[900] , Colors.white)  , 

                    
                    // Start Camera
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Ports and Connectivity",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    mySpec(context , "USB: " , widget.usb_d  , Colors.green , Colors.white)  , 
                    mySpec(context , "HDMI: " , widget.hdmi_d   , Colors.white , Colors.green)  , 
                    mySpec(context , "VGA: " , widget.vga_d    , Colors.green , Colors.white)  , 
                    mySpec(context , "Card Reader: " , widget.card_reader_d    , Colors.white , Colors.green)  , 
                    mySpec(context , "Ethernet LAN: " , widget.ethernet_lan_d   ,  Colors.green , Colors.white)  , 
                    mySpec(context , "Wi-Fi: " , widget.wi_fi_d    , Colors.white , Colors.green)  ,
                    mySpec(context , "Bluetooth: " , widget.bluetooth_d    ,  Colors.green , Colors.white)  ,
                    mySpec(context , "Audio Jack: " , widget.audio_jack_d   , Colors.white , Colors.green)  ,
                    mySpec(context , "Web Camera: " , widget.web_camera_d    ,  Colors.green , Colors.white)  ,
                    mySpec(context , "Microphone: " , widget.microphone_d    , Colors.white , Colors.green)  ,
                    mySpec(context , "Speakers: " , widget.speakers_d    ,  Colors.green , Colors.white)  ,
                    // End camera
                   // Start Price
                    
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Prices",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    mySpec(context , "Dollar: " , widget.dollar_d   , Colors.blue , Colors.white)  ,
                    mySpec(context , "Euro: " , widget.euro_d    , Colors.white , Colors.blue)  ,
                    // End price

                  ],
                ),
              )
              // End Column Specfiction
            ],
          ),
        );
  }
}



 mySpec(context , String feature ,String details , Color colorbackground , Color colortext){
   return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        color: colorbackground,
                        child: RichText(
                          text: TextSpan(
                              style:
                                  TextStyle(fontSize: 19, color: Colors.black , ),
                              children:  [
                                 
                                TextSpan(text: feature),
                                TextSpan(
                                    text: details,
                                    style: TextStyle(color: colortext)),
                                    
                              ]),
                        )
                        ) ; 
 }