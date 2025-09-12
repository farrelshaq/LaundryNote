import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://nbywktareudymgcdaqjz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5ieXdrdGFyZXVkeW1nY2RhcWp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc0MDMzOTksImV4cCI6MjA3Mjk3OTM5OX0.Wq3qdS8mUF7HeB1T-511bs3uV2wVRbL0nMKyu2V1A6o',

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laundry Note',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
