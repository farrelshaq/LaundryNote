import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/revenue_custom.dart';
import '../widgets/order_baru_dialog.dart';
import '../../pelanggan/pages/pelanggan_page.dart';
import '../../laporan/pages/laporan_page.dart';
import '../../profile/pages/profile_page.dart';
import '../models/order_model.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    final pages = [
      _buildHomePage(context, controller), // Beranda
      const LaporanPage(),
      const PelangganPage(),
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

  Widget _buildHomePage(BuildContext context, DashboardController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevenueCard(),
          const SizedBox(height: 20),

          // Statistik dummy (nantinya bisa dihitung dari Supabase)
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
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => OrderBaruDialog(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 87, 177, 255),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Order Baru", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
          const SizedBox(height: 10),

          OutlinedButton.icon(
            onPressed: () {
              Get.to(() => const PelangganPage());
            },
            icon: const Icon(Icons.people),
            label: const Text("Lihat Pelanggan"),
          ),
          const SizedBox(height: 20),

          const Text("Order Terbaru", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          const SizedBox(height: 10),
          Obx(() {
            if (controller.orderTerbaru.isEmpty) {
              return const Text("Belum ada order hari ini.");
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.orderTerbaru.length,
              itemBuilder: (context, index) {
                final Order order = controller.orderTerbaru[index];
                return Card(
                  child: ListTile(
                    title: Text(order.nama),
                    subtitle: Text("Layanan: ${order.layanan} - Berat: ${order.berat} kg"
                    ),
                    trailing: Text("Rp ${order.harga.toStringAsFixed(0)}"),
                  ),
                );
              },
            );
          }),
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
              Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(label, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
