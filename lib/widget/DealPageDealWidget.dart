import 'package:flutter/material.dart';


class DealsWidget extends StatefulWidget {
  DealsWidget({@required this.url,@required this.title,@required this.locationname, @required this.distance,@required this.date});
  String url;
  String title;
  String locationname;
  double distance;
  String date;

  @override
  _DealsWidgetState createState() => _DealsWidgetState();
}

class _DealsWidgetState extends State<DealsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          border: Border.all(color: Colors.blueAccent)
      ),
      child: Column(
        children: [

          Container(child:Image.network(widget.url),height: 50,width: 50,),
          Center(child:Text(widget.title)),
          Center(child:(Text(widget.locationname))),
          Center(child:Text((widget.distance/10000).round().toString()+" Meters Away")),

        ],
      ),

    );
  }
}
