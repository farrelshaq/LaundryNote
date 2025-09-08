import 'package:get/get.dart';
import 'package:laundrynote/modules/login/login_page.dart';
import '../modules/dashboards/pages/dashboard_page.dart';
import '../modules/dashboards/bindings/dashboard_binding.dart';
import '../modules/laporan/pages/laporan_page.dart';
import '../modules/laporan/bindings/laporan_binding.dart';
import '../modules/pelanggan/pages/pelanggan_page.dart';
import '../modules/pelanggan/bindings/pelanggan_binding.dart';

class AppPages {
  static const initial = '/login';

  static final routes = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: '/laporan',
      page: () => const LaporanPage(),
      binding: LaporanBinding(),
    ),
    GetPage(
      name: '/pelanggan',
      page: () => const PelangganPage(),
      binding: PelangganBinding(),
    ),
  ];
}
