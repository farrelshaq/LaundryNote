import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundrynote/modules/dashboards/widgets/revenue_custom.dart';
import 'package:laundrynote/modules/laporan/pages/laporan_page.dart';
import 'package:laundrynote/modules/pelanggan/pages/pelanggan_page.dart';
import 'package:laundrynote/modules/profile/pages/profile_page.dart';
import '../controllers/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    final pages = [
      _buildHomePage(context), // ⬅️ kirim context
      const LaporanPage(),
      PelangganPage(),
      const ProfilePage(),
    ];

    return Obx(() => Scaffold(
          appBar: controller.currentIndex.value == 0
              ? AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text("Laundry Berkah Jaya"),
                  centerTitle: false,
                )
              : null,
          body: pages[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            selectedItemColor: const Color.fromARGB(255, 58, 163, 255),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: controller.changeTab,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Laporan"),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: "Pelanggan"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
            ],
          ),
        ));
  }

  /// ========== HOME ==========
  Widget _buildHomePage(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevenueCard(),
          const SizedBox(height: 20),

          // Statistik
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard("12", "Order Hari Ini", Icons.shopping_bag),
              _buildStatCard("8", "Selesai", Icons.check_circle),
              _buildStatCard("4", "Proses", Icons.access_time),
            ],
          ),
          const SizedBox(height: 20),

          // Tombol Order Baru
          ElevatedButton(
            onPressed: () => _showOrderBaruDialog(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 58, 163, 255),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Center(
              child: Text("Order Baru", style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 10),

          // Tombol Lihat Pelanggan
          OutlinedButton.icon(
            onPressed: () {
              Get.to(() => PelangganPage());
            },
            icon: const Icon(Icons.people),
            label: const Text("Lihat Pelanggan"),
          ),
          const SizedBox(height: 20),

          // Order terbaru
          const Text(
            "Order Terbaru",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const ListTile(
            title: Text("Ibu Sari"),
            subtitle: Text("Cuci Kering"),
            trailing: Text(
              "Rp 15,000",
              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            title: Text("Pak Budi"),
            subtitle: Text("Cuci Setrika"),
            trailing: Text(
              "Rp 25,000",
              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  /// ========== POPUP ORDER BARU ==========
  void _showOrderBaruDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Stack(
            children: [
              // Isi Form
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order Baru",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),

                    const Text("Nama Pelanggan *"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Masukkan nama pelanggan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const Text("No. Telepon *"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Masukkan nomor telepon",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text("Jenis Layanan *"),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: "Cuci Kering", child: Text("Cuci Kering")),
                        DropdownMenuItem(value: "Cuci Setrika", child: Text("Cuci Setrika")),
                        DropdownMenuItem(value: "Express", child: Text("Express")),
                      ],
                      onChanged: (_) {},
                    ),
                    const SizedBox(height: 20),

                    const Text("Harga"),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "0",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Simpan Order", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),

              // Tombol Close (X)
              Positioned(
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(ctx).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// ========== CARD ==========
  Widget _buildStatCard(String value, String label, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: Colors.purple, size: 28),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(label, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
