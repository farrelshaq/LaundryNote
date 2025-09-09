import 'package:get/get.dart';
import '../services/dashboard_service.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  var orderTerbaru = <Map<String, dynamic>>[].obs;

  final _service = DashboardService();

  void changeTab(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    final result = await _service.getOrdersToday();
    orderTerbaru.assignAll(result);
  }

  Future<void> addOrder({
    required String nama,
    required String telepon,
    required String layanan,
    required int harga,
  }) async {
    await _service.insertOrder(
      nama: nama,
      telepon: telepon,
      layanan: layanan,
      harga: harga,
    );
    await fetchOrders(); // Refresh the list after adding a new order
  }
}
