import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:latihan/baliimage.dart';
import 'package:latihan/borobudur2.dart';
import 'package:latihan/bromoimage.dart';
import 'package:latihan/image2.dart';
import 'package:latihan/latihanimage.dart';
import 'package:latihan/login.dart';
import 'package:latihan/rajaampatimage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      
      title: Text("Tables"),),
    body: Column(children: [

      ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));

      } , child: Text("Login")),

      ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LatihanImage(),));


      } , child: Text("Malioboro")),

              ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Bromoimage(destination: {},),));

      } , child: Text("Bromo")),

        ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Rajaampatimage(),));

      } , child: Text("Raja Ampat")),

        ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Borobudur2(),));

      } , child: Text("Borobudur")),

        ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Baliimage(),));

      } , child: Text("Bali"))
    ],),
    );
  }
}