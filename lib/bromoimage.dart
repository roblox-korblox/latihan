import 'package:flutter/material.dart';

class Bromoimage extends StatelessWidget {
  final Map<String, Object> destination;

  const Bromoimage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination['nama'] as String),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---------------- GAMBAR ----------------
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                destination['image'] as String,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- JUDUL & LOKASI ----------------
            Text(
              destination['nama'] as String,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              '${destination['wilayah']} • ${destination['lokasi']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 12),

            // ---------------- RATING ----------------
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  (destination['rating'] as double).toStringAsFixed(1),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ---------------- DESKRIPSI ----------------
            Text(
              'Deskripsi',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              destination['deskripsi'] as String,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            // ===========================================================
            //               BAGIAN YANG KAMU BUNDARKAN (TABEL)
            // ===========================================================

            Row(
              children: [
                _infoRow("Kuliner", destination['makanan'] as String),
              ],
            ),
            _infoRow("Budaya", destination['budaya'] as String),
            _infoRow("Bahasa", destination['bahasa'] as String),
            _infoRow("Rumah Adat", destination['rumah'] as String),
            _infoRow("Baju Khas", destination['baju adat'] as String),

            const SizedBox(height: 20),

            // ---------------- BOX BIRU ----------------
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Informasi ini ditujukan untuk edukasi dan referensi wisata.\nTidak ada fitur pemesanan.",
                style: TextStyle(fontSize: 14),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ------------------- FUNGSI ROW 2 KOLOM -------------------
  Widget _infoRow(String left, String right) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120, // kolom kiri rata
            child: Text(
              left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          Expanded(
            child: Text(
              right,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
