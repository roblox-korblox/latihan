import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan/bromoimage.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      
      title: Text("Bromo"),),
    body: Column(children: [
     
      ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Bromoimage(destination: {},),));

      }, child: Text("Mount Bromo"))

    ],),
    );
  }
}