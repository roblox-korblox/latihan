import 'package:flutter/material.dart';
import 'package:latihan/latianposisi.dart';

class Homedashboard extends StatefulWidget {
  const Homedashboard({super.key});

  @override
  State<Homedashboard> createState() => _HomedashboardState();
}

class _HomedashboardState extends State<Homedashboard> {



  List topImage = [

"asset/eveborobudur.jpg",
"asset/rajaampat.jpg",
"asset/malioboro.jpg",
"asset/bali.jpg"
"asset/tamanmini.jpg"
  ];

List namakota = [

  'Borobudur', 'Laut Raja Ampat', 'Kota Jogja', 'Bali', 'Kota Jakarta',
];

List makanantradisional = [


];
  

  @override

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      
      title: Text("Home Dashboard"),),
    body: SingleChildScrollView(

      child: Column(
        children: [
          SizedBox(

            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topImage.length,
              itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(topImage[index]),
              );
            }), 
          ),
          SizedBox(height: 50,),
          ListView.builder(


            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: topImage.length,
            itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => Latianposisi(image: topImage[index], namakota: namakota[index], makanantradisional: makanantradisional[index],),));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                
                child: Image.asset(topImage[index]),

              ),
            );
  
          })
        
        ],
      ),
    ),

    );
  }
}