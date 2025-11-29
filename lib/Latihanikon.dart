import 'package:flutter/material.dart';

class Latihanikon extends StatefulWidget {
  const Latihanikon({super.key});

  @override
  State<Latihanikon> createState() => _LatihanikonState();
}

class _LatihanikonState extends State<Latihanikon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ikon Latihan")),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.car_crash, size: 50, color: Colors.red),
          SizedBox(width: 20),
          Icon(Icons.home, size: 50, color: Colors.blue),
          SizedBox(width: 20),
          Icon(Icons.favorite, size: 50, color: Colors.pink),
        ],
      ),
    );
  }
}
