import 'package:flutter/material.dart';
import '../persistent/Repository.dart';

class DealsPage extends StatefulWidget {
  static const String id='DealsPageID';

  //DealsPage({@required this.latitude, @required this.longitude });
  double latitude;
  double longitude;

  @override
  _DealsPageState createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  @override

  void GetDeals(double longitude,double latitude) async{
    List<List<Widget>>deals= await GetNearestDeals(widget.latitude,widget.longitude);
    print ("DealsGotten");
    setState(() {
      featureddeals=deals[0];
      restofdeals=deals[1];

    });


  }
  List<Widget> featureddeals=[Text("Please wait while we load")];
  List<Widget> restofdeals=[Text("Please Wait while we load")];

  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null){
      widget.longitude=arguments['longitude'];
      widget.latitude=arguments['latitude'];
      print (widget.longitude);
      GetDeals(widget.longitude,widget.latitude);
    }



      return Scaffold(
        body: Column(
          children: [
            Text("FEATURED DEALS"),
            Container(child:

            ListView.builder(
              itemCount: featureddeals.length,
              itemBuilder: (BuildContext context, int Index){
                return Expanded(child:featureddeals[Index]);
              }, scrollDirection: Axis.horizontal,
            ),
            height:  MediaQuery.of(context).size.width*.3,width: MediaQuery.of(context).size.width,),

            Text('Other Deals'),
        Expanded(child:ListView.builder(
          itemCount: restofdeals.length,
          itemBuilder: (BuildContext context, int Index){
            return Expanded(child:restofdeals[Index]);
          }, scrollDirection: Axis.vertical,
        ),),


          ],
        ),
      );
    }
  }

