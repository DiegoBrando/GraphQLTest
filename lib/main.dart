

import 'package:flutter/material.dart';
import 'ui/Homepage.dart';
import 'ui/DealsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return
      MaterialApp(

        color: Colors.white,
        initialRoute: HomePage.id,
        routes: {

          HomePage.id:(context)=> HomePage(),
          DealsPage.id:(context)=>DealsPage(),






        },
      );
  }
}