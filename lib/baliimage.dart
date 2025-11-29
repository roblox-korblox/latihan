import 'package:flutter/material.dart';

class Baliimage extends StatefulWidget {
  const Baliimage({super.key});

  @override
  State<Baliimage> createState() => _BaliimageState();
}

class _BaliimageState extends State<Baliimage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bali"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [

          // FOTO
          SizedBox(
            height: 300,
            child: Image.asset(
              'asset/bali.jpg',
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

          // KONTEN PUTIH
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Lombok Barat",
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
                    Text("4.9", style: TextStyle(fontSize: 16)),
                  ],
                ),

                const SizedBox(height: 12),

                const Text(
                  "Pura Ulun Danu Beratan adalah salah satu pura paling terkenal di Bali dan menjadi ikon wisata pulau tersebut.",
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),

                const SizedBox(height: 20),

                buildDetailRow("Kuliner", " Sate Lilit, Ayam Betutu"),
                buildDetailRow("Budaya", "Tari Kecak"),
                buildDetailRow("Bahasa", "Bahasa Bali dan Bahasa Indonesia"),
                buildDetailRow("Rumah Adat", "Aling-aling"),
                buildDetailRow("Baju Khas", "Kebaya Bali"),

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
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
