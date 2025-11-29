import 'package:flutter/material.dart';

class LatihanImage extends StatefulWidget {
  const LatihanImage({super.key});

  @override
  State<LatihanImage> createState() => _LatihanImageState();
}

class _LatihanImageState extends State<LatihanImage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Malioboro"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // ========== GAMBAR BESAR ==========
            SizedBox(
              height: 300,
              child: Image.asset(
                'asset/malioboro.jpg',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // ========== KONTEN ==========
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // PROVINSI / LOKASI
                  const Text(
                    "Daerah Istimewa Yogyakarta",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // RATING (posisi tepat di bawah gambar)
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      SizedBox(width: 4),
                      Text("4.7", style: TextStyle(fontSize: 16)),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // DESKRIPSI
                  const Text(
                    "Jalan Malioboro adalah kawasan ikonik di Yogyakarta "
                    "yang terkenal dengan suasana khasnya, deretan toko, PKL "
                    "dan hiburan jalanan.",
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),

                  const SizedBox(height: 20),

                  // DETAIL INFORMASI
                  buildDetailRow("Kuliner", "Gudeg Yu Djum"),
                  buildDetailRow("Budaya", "Tari Ramayana"),
                  buildDetailRow("Bahasa", "Jawa dan Indonesia"),
                  buildDetailRow("Rumah Adat", "Joglo"),
                  buildDetailRow("Pakaian", "Beskap, Batik Lurik"),

                  const SizedBox(height: 20),

                  // INFORMASI TAMBAHAN
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade50,
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

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
