import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Indonesia',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DashboardPage(),
    );
  }
}

const _destinations = [
  {
    'nama': 'Malioboro',
    'wilayah': 'Jawa Tengah',
    'lokasi': 'Jogjakarta',
    'image': 'asset/malioboro.jpg',
    'deskripsi':
        'Malioboro adalah jalan legendaris dan ikon di pusat kota Jogja yang membentang dari Tugu Jogja.',
    'makanan': 'Gudeg Jogja',
    'budaya': 'Tari golek Ayun-Ayun',
    'bahasa': 'Bahasa Indonesia',
    'rumah': 'Rumah Joglo',
    'baju adat': 'Surjan dan Kebaya',
    'rating': 4.8,
  },
  {

    'nama': 'Gunung Bromo',
    'wilayah': 'Jawa Timur',
    'lokasi': 'Taman Nasional Bromo Tengger Semeru, Jawa Timur',
    'image': 'asset/bromo.jpeg',
    'deskripsi':
        'Gunung Bromo adalah gunung berapi aktif yang terkenal dengan pemandangan alamnya.',
    'makanan': 'Nasi Aron, Sawut, Wedang Pokak',
    'budaya': 'Tari Sodoran',
    'bahasa': 'Bahasa Tengger',
    'rumah': 'Rumah Suku Tengger',
    'baju adat': 'Beskap dan Kain Batik',
    'rating': 4.8,
  },
  {
    'nama': 'Candi Borobudur',
    'wilayah': 'Jawa Tengah',
    'lokasi': 'Magelang, Jawa Tengah',
    'image': 'asset/eveborobudur.jpg',
    'deskripsi': 'Candi Budha terbesar di dunia dan salah satu warisan UNESCO.',
    'makanan': 'Arsik Ikan Mas, Saksang',
    'budaya': 'Gondang, Tortor Batak',
    'bahasa': 'Bahasa Batak',
    'rumah': 'Rumah Bolon',
    'baju adat': 'Ulos Batak',
    'rating': 4.9,
  },
  {
    'nama': 'Taman Mini Indonesia Indah',
    'wilayah': 'Jakarta',
    'lokasi': 'Jakarta Timur',
    'image': 'asset/tamanmini.jpg',
    'deskripsi':
        'Taman yang merangkum rumah adat, museum, dan budaya tiap provinsi di Indonesia.',
    'makanan': 'Kerak Telor, Asinan Betawi',
    'budaya': 'Lenong, Ondel-ondel',
    'bahasa': 'Bahasa Betawi',
    'rumah': 'Rumah Kebaya',
    'baju adat': 'Baju Sadariah',
    'rating': 4.7,
  },
  {
    'nama': 'Wisata Bali Heritage',
    'wilayah': 'Bali',
    'lokasi': 'Badung & Gianyar',
    'image': 'asset/bali.jpg',
    'deskripsi':
        'Perpaduan pantai, pura, dan sawah berundak khas Pulau Dewata.',
    'makanan': 'Ayam Betutu, Lawar',
    'budaya': 'Tari Kecak, Upacara Ngaben',
    'bahasa': 'Bahasa Bali',
    'rumah': 'Rumah Pekarangan',
    'baju adat': 'Kebaya Bali',
    'rating': 5.0,
  },
  {
    'nama': 'Laut Raja Ampat',
    'wilayah': 'Papua Barat',
    'lokasi': 'Provinsi Papua Barat Daya',
    'image': 'asset/rajaampat.jpg',
    'deskripsi': 'Laut Raja Ampat adalah perairan dengan keanekaragaman hayati laut tertinggi di dunia..',
    'makanan': 'Ikan Bungkus, Udang Selingkuh',
    'budaya': 'Tari Suling Tambur',
    'bahasa': 'Bahasa Indonesia dan Matbat',
    'rumah': 'Rumah Honai',
    'baju adat': "Koteka",
    'rating': 4.5,
  },
];

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _selectedRegion = 'Semua';

  List<Map<String, Object>> get _popular => _destinations.take(4).toList();

  List<Map<String, Object>> get _filtered => _selectedRegion == 'Semua'
      ? _destinations
      : _destinations
          .where((item) => item['wilayah'] == _selectedRegion)
          .toList();

  List<String> get _regions {
    final names =
        _destinations.map((e) => e['wilayah'] as String).toSet().toList();
    names.sort();
    return ['Semua', ...names];
  }

  void _openDetail(Map<String, Object> destination) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetailPage(destination: destination)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dasbor Wisata'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _HighlightSlider(items: _popular, onTap: _openDetail),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedRegion,
            decoration: const InputDecoration(labelText: 'Filter Pulau'),
            items: _regions
                .map((name) => DropdownMenuItem(value: name, child: Text(name)))
                .toList(),
            onChanged: (value) =>
                setState(() => _selectedRegion = value ?? 'Semua'),
          ),
          const SizedBox(height: 12),
          ..._filtered
              .map(
                (item) => _DestinationCard(
                  data: item,
                  onTap: () => _openDetail(item),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}


class _HighlightSlider extends StatefulWidget {
  const _HighlightSlider({required this.items, required this.onTap});

  final List<Map<String, Object>> items;
  final void Function(Map<String, Object>) onTap;

  @override
  State<_HighlightSlider> createState() => _HighlightSliderState();
}

class _HighlightSliderState extends State<_HighlightSlider> {
  final _controller = PageController(viewportFraction: 0.85);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return GestureDetector(
            onTap: () => widget.onTap(item),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(item['image'] as String),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomLeft,
                child: Text(
                  item['nama'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DestinationCard extends StatelessWidget {
  const _DestinationCard({required this.data, required this.onTap});

  final Map<String, Object> data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            data['image'] as String,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          data['nama'] as String,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('${data['wilayah']} • ${data['lokasi']}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            Text((data['rating'] as double).toStringAsFixed(1)),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, Object> destination;

  const DetailPage({super.key, required this.destination});

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

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                destination['image'] as String,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),


            Text(
              destination['nama'] as String,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '${destination['wilayah']} • ${destination['lokasi']}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 12),


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
            const SizedBox(height: 16),


            Text(
              'Deskripsi',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              destination['deskripsi'] as String,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),


            Text(
              'Makanan Khas',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              destination['makanan'] as String,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),

 
            Text(
              'Budaya',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              destination['budaya'] as String,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),


            Text(
              'Bahasa',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              destination['bahasa'] as String,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),


            Text(
              'Rumah Adat',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              destination['rumah'] as String,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),

    
            Text(
              'Baju Adat',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              destination['baju adat'] as String,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
