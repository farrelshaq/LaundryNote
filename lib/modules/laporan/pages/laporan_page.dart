import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundrynote/modules/laporan/widgets/laporan_widget.dart';
import '../controllers/laporan_controller.dart';

class LaporanPage extends StatelessWidget {
  const LaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LaporanController>(); 
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Keuangan", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: InkWell(
                onTap: controller.tambahPendapatan,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Icon(Icons.add, color: Colors.deepPurple),
                    SizedBox(width: 8.0),
                    Text(
                      "Tambahkan Pendapatan Hari Ini",
                      style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => RingkasanCard(
                      label: "Total Pendapatan",
                      value: "Rp ${controller.totalPendapatan.value}",
                      subLabel: "Hari ini: Rp 0",
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Obx(
                    () => RingkasanCard(
                      label: "Total Pengeluaran",
                      value: "Rp ${controller.totalPengeluaran.value}",
                      subLabel: "Hari ini: Rp 0",
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => RingkasanCard(
                      label: "Laba Bersih",
                      value: "Rp ${controller.labaBersih.value}",
                      subLabel: "Pendapatan - Pengeluaran",
                      color: Colors.blue.shade800,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Obx(
                    () => RingkasanCard(
                      label: "Omzet Total",
                      value: "Rp ${controller.omzetTotal.value}",
                      subLabel: "Semua transaksi",
                      color: Colors.blue.shade800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => BulananCard(
                      label: "Bulan Ini",
                      pendapatan: controller.pendapatanBulanIni.value,
                      pengeluaran: controller.pengeluaranBulanIni.value,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Obx(
                    () => BulananCard(
                      label: "Bulan Lalu",
                      pendapatan: controller.pendapatanLalu.value,
                      pengeluaran: controller.pengeluaranLalu.value,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => BulananCard(
                label: "Laba Minggu Ini",
                isLaba: true,
                laba: controller.labaMingguIni.value,
              ),
            ),
            const SizedBox(height: 24.0),

            const Text(
              "Pertumbuhan Mingguan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const LinearProgressIndicator(
              value: 0.8,
              backgroundColor: Colors.grey,
              color: Colors.deepPurple,
              minHeight: 10,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Rp 800,000",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}