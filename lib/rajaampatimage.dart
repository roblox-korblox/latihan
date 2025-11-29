import 'package:flutter/material.dart';

class Rajaampatimage extends StatefulWidget {
  const Rajaampatimage({super.key});

  @override
  State<Rajaampatimage> createState() => _RajaampatimageState();
}

class _RajaampatimageState extends State<Rajaampatimage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Raja Ampat"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
   
            SizedBox(
              height: 300,
              child: Image.asset(
                'asset/rajaampat.jpg',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Papua Barat",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),


                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      SizedBox(width: 4),
                      Text("5.0", style: TextStyle(fontSize: 16)),
                    ],
                  ),

                  const SizedBox(height: 12),

    
                  const Text(
                    "Raja Ampat merupakan gugusan kepulauan yang terletak di bagian kepala burung Pulau Papua.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),

                  const SizedBox(height: 20),

                 
                  buildDetailRow("Kuliner", "Ikan Bakar Manokwari"),
                  buildDetailRow("Budaya", "Tari Suanggi"),
                  buildDetailRow("Bahasa", "Indonesia, Melayu Papua, Suku Dani"),
                  buildDetailRow("Rumah Adat", "Rumah Honai"),
                  buildDetailRow("Baju Khas", "Koteka"),

                  const SizedBox(height: 20),

 
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Informasi ini ditujukan untuk edukasi dan referensi wisata. "
                      "Tidak ada fitur pemesanan.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
