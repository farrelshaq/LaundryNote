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
      _buildHomePage(),
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Beranda"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart), label: "Laporan"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "Pelanggan"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profil"),
            ],
          ),
        ));
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevenueCard(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard("12", "Order Hari Ini", Icons.shopping_bag),
              _buildStatCard("8", "Selesai", Icons.check_circle),
              _buildStatCard("4", "Proses", Icons.access_time),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 58, 163, 255),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Center(
              child: Text("Order Baru", style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.people),
            label: const Text("Lihat Pelanggan"),
          ),
          const SizedBox(height: 20),
          const Text("Order Terbaru",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const ListTile(
            title: Text("Ibu Sari"),
            subtitle: Text("Cuci Kering"),
            trailing: Text("Rp 15,000",
                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
          ),
          const ListTile(
            title: Text("Pak Budi"),
            subtitle: Text("Cuci Setrika"),
            trailing: Text("Rp 25,000",
                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: Colors.purple, size: 28),
              const SizedBox(height: 8),
              Text(value,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text(label, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
