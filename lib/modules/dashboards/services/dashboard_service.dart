import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardService {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getOrdersToday() async {
    return await supabase
        .from('orders')
        .select()
        .eq('tanggal', DateTime.now().toIso8601String().substring(0, 10))
        .order('created_at', ascending: false);
  }

  Future<void> insertOrder({
    required String nama,
    required String telepon,
    required String layanan,
    required int harga,
  }) async {
    await supabase.from('orders').insert({
      'nama': nama,
      'telepon': telepon,
      'layanan': layanan,
      'harga': harga,
      'status': 'Proses',
      'tanggal': DateTime.now().toIso8601String().substring(0, 10),
      'created_at': DateTime.now().toIso8601String(),
    });
  }
}
