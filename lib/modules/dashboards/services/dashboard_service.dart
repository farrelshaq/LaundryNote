import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardService {
  final supabase = Supabase.instance.client;

  Future<void> insertOrder({
    required String nama,
    required String telepon,
    required String layanan,
    required int harga,
    required double berat,
  }) async {
    final response = await supabase.from('orders').insert({
      'nama': nama,
      'telepon': telepon,
      'layanan': layanan,
      'harga': harga,
      'berat': berat,
      'created_at': DateTime.now().toIso8601String(),
    });

    if (response.error != null) {
      print("❌ Gagal insert: ${response.error!.message}");
    } else {
      print("✅ Insert sukses: $response");
    }
  }

  Future<List<Map<String, dynamic>>> getOrdersToday() async {
    final today = DateTime.now();
    final start = DateTime(today.year, today.month, today.day);

    final response = await supabase
        .from('orders')
        .select()
        .gte('created_at', start.toIso8601String())
        .order('created_at', ascending: false);

    return List<Map<String, dynamic>>.from(response);
  }
}
