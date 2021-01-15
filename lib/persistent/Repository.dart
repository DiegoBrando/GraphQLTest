import 'package:flutter/material.dart';
import '../persistent/Queries.dart';
import '../apicalls/GraphQLCall.dart';
import '../widget/DealPageDealWidget.dart';

String interpolate(String string, {Map<String, dynamic> params = const {}}) {
  var keys = params.keys;
  String result = string;
  for (var key in keys) {
    result = result.replaceAll('{{$key}}', params[key]);
  }

  return result;
}

Future<List<List<Widget>>> GetNearestDeals(double latitude,double longitude)async{

  String temp=interpolate(closestlocations,params:{'latitude':latitude.toString(),'longitude':longitude.toString()});
//print(temp);
  //print("CALLING");
  var data= await AGraphQLCall.Query(temp);
  //print ("CALLED");
  //print(data);
  List<Widget> featureddeals=[];
  List<Widget> restofdeals=[];
  data=data['closestlocations'];
  //print ("KKKK");
  for (Map location in data){
    String locationname=location['locationname'];
    String imageurl=location['featuredimage'][0]['url'];
    String featureddealtitle=location['featureddeal'][0]['dealtitle'];
    String featureddealdate=location['featureddeal'][0]['date'].toString();
    double distance=location['distance'];

    featureddeals.add(DealsWidget(url:imageurl,title:featureddealtitle,locationname:locationname, distance:distance,date:featureddealdate));
    for (Map deals in location['restofdeal']){
      String dealtitle=deals['dealtitle'];
      String dealdate=deals['date'].toString();
      restofdeals.add(DealsWidget(url:imageurl,title:dealtitle,locationname:locationname,distance:distance,date:dealdate));
    }




  }
  print ("OKKKK");
  return [featureddeals,restofdeals];








}