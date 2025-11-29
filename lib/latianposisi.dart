import 'package:flutter/material.dart';

class Latianposisi extends StatefulWidget {
  const Latianposisi({super.key, required this.image, required this.namakota, required makanantradisional});
  final String image;
  final String namakota; 
  @override
  State<Latianposisi> createState() => _LatianposisiState();
}

class _LatianposisiState extends State<Latianposisi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      
      title: Text("Latihan Posisi"),),
    body: Column(children: [

      Image.asset(widget.image),
      SizedBox(height: 50,),
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(children: [
          Text("Wisata Bali"), 
          SizedBox(width: 10,),
          Text("5.0"),
          SizedBox(width: 10,),
          Icon(Icons.star, color: Colors.amberAccent)
          
          ],),
      ),        
      SizedBox(height: 30,),           
      InfoRow(nama : "Nama Kota", detail: widget.namakota),
      SizedBox(height: 10,),
      InfoRow(nama : "Rumah Adat", detail: "Bali",),
      SizedBox(height: 10,),
      InfoRow(nama : "Kesenian", detail: "Bali",),

    ],),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key, required this.nama, required this.detail,
  });
 final String nama;
 final String detail;
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(children: [
      Expanded(child: Text(nama, style: TextStyle(fontWeight: FontWeight.bold),)),
      Expanded(child: Text(detail))
      
      ],),
    );
  }
}