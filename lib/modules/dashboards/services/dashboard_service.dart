import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardService {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getOrdersToday() async {
    return await supabase
        .from('orders')
        .select()
        .eq('tanggal', DateTime.now().toIso8601String().substring(0, 10));
  }
}
