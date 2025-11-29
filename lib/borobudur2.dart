import 'package:flutter/material.dart';

class Borobudur2 extends StatefulWidget {
  const Borobudur2({super.key});

  @override
  State<Borobudur2> createState() => _Borobudur2State();
}

class _Borobudur2State extends State<Borobudur2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Borobudur"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
              child: Image.asset(
                "asset/eveborobudur.jpg",
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
                    "Jawa Tengah",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      SizedBox(width: 4),
                      Text(
                        "4.9",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Candi Borobudur adalah sebuah candi Buddha terbesar di dunia "
                    "yang berada di Magelang, Jawa Tengah, Indonesia.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),

                  const SizedBox(height: 20),

                  buildDetailRow("Kuliner", "Sate Blengong dan Mendoan"),
                  buildDetailRow("Budaya", "Tari Gambyong"),
                  buildDetailRow("Bahasa", "Jawa dan Indonesia"),
                  buildDetailRow("Rumah Adat", "Rumah Joglo"),
                  buildDetailRow("Baju Khas", "Beskap dan Kain Batik"),

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
                      style: TextStyle(fontSize: 14, color: Colors.black),
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
              style: const TextStyle(fontWeight: FontWeight.bold),
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
