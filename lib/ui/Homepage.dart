import 'package:dealspage/ui/DealsPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id='HomePageID';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double latitude=0.0;
  double longitude=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Please Enter Lat and Long and hit next"),
          TextField(onChanged: (text){
            setState(() {
              latitude=double.tryParse(text);
            });
          },),

          TextField(onChanged: (text){
            setState(() {
              longitude=double.tryParse(text);
            });
          },),
          TextButton(child: Text("Press here"),onPressed:(){
            Navigator.pushNamed(context, DealsPage.id,arguments: {'longitude':longitude,'latitude':latitude});},)


        ],


      )
      ,

    );
  }
}
