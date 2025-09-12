import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class OrderBaruDialog extends StatelessWidget {
  final namaController = TextEditingController();
  final teleponController = TextEditingController();
  final layananController = TextEditingController();
  final hargaController = TextEditingController();
  final beratController = TextEditingController();

  OrderBaruDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Baru",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  _buildField("Nama Pelanggan *", namaController, "Masukkan nama pelanggan"),
                  const SizedBox(height: 12),

                  _buildField("No. Telepon *", teleponController, "Masukkan nomor telepon"),
                  const SizedBox(height: 12),

                  const Text("Jenis Layanan *"),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    items: const [
                      DropdownMenuItem(value: "Cuci Kering", child: Text("Cuci Kering")),
                      DropdownMenuItem(value: "Cuci Setrika", child: Text("Cuci Setrika")),
                      DropdownMenuItem(value: "Express", child: Text("Express")),
                    ],
                    onChanged: (val) {
                      layananController.text = val ?? "";
                    },
                  ),
                  const SizedBox(height: 12),

                  _buildField("Harga", hargaController, "0", keyboardType: TextInputType.number),
                  const SizedBox(height: 12),

                  _buildField("Berat Laundry (Kg)", beratController, "Contoh: 4", keyboardType: TextInputType.number),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final nama = namaController.text.trim();
                        final telepon = teleponController.text.trim();
                        final layanan = layananController.text.trim();
                        final harga = int.tryParse(hargaController.text.trim()) ?? 0;
                        final berat = double.tryParse(beratController.text.trim()) ?? 0;

                        if (nama.isEmpty || telepon.isEmpty || layanan.isEmpty) {
                          Get.snackbar("Error", "Harap isi semua data wajib!");
                          return;
                        }

                        await controller.addOrder(
                          nama: nama,
                          telepon: telepon,
                          layanan: layanan,
                          harga: harga,
                          berat: berat,
                        );

                        Navigator.of(context).pop(); // tutup dialog
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
          ),

          // Tombol close (X)
          Positioned(
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, String hint,
      {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
