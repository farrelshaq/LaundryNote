import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../laporan/controllers/laporan_controller.dart';
import '../../pelanggan/controllers/pelanggan_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.lazyPut(() => LaporanController());
    Get.lazyPut(() => PelangganController());
  }
}
