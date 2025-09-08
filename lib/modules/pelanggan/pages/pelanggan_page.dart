import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pelanggan_controller.dart';

class PelangganPage extends GetView<PelangganController> {
  const PelangganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Pelanggan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Histori transaksi pelanggan...',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 24),

              Obx(() {
                final list = controller.filteredPelanggan;

                if (list.isEmpty) {
                  return const Center(child: Text('Tidak ada pelanggan.'));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final namaPelanggan = list[index];
                    return _buildPelangganCard(namaPelanggan);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (value) => controller.searchPelanggan(value),
      decoration: InputDecoration(
        hintText: 'Cari nama pelanggan...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildPelangganCard(String nama) {
    bool isLunas = nama == 'Ibu Sari';
    bool isBelumBayar = nama == 'Pak Budi';

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isLunas ? Colors.green[100] : Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isLunas ? 'Lunas' : 'Belum Bayar',
                    style: TextStyle(
                      color: isLunas ? Colors.green[800] : Colors.orange[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '0812-3456-7890 • 2 hari lalu',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isLunas ? 'Rp 125,000' : 'Rp 85,000',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  isLunas ? '5 order' : '3 order',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Histori Transaksi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildTransaksiItem('15 Jan', 'Cuci Kering', 'Rp 15,000', true),
            _buildTransaksiItem('10 Jan', 'Cuci Setrika', 'Rp 25,000', true),
            _buildTransaksiItem('5 Jan', 'Cuci express', 'Rp 35,000', true),
          ],
        ),
      ),
    );
  }

  Widget _buildTransaksiItem(
      String tanggal, String layanan, String harga, bool selesai) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tanggal, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(layanan, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(harga, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                selesai ? 'selesai' : 'proses',
                style: TextStyle(color: selesai ? Colors.green : Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
