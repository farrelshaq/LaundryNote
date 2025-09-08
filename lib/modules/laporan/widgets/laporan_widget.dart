import 'package:flutter/material.dart';

class RingkasanCard extends StatelessWidget {
  final String label;
  final String value;
  final String subLabel;
  final Color color;

  const RingkasanCard({
    super.key,
    required this.label,
    required this.value,
    required this.subLabel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 4.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              subLabel,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk kartu bulanan (Bulan Ini, Bulan Lalu)
class BulananCard extends StatelessWidget {
  final String label;
  final String? pendapatan;
  final String? pengeluaran;
  final String? laba;
  final bool isLaba;

  const BulananCard({
    super.key,
    required this.label,
    this.pendapatan,
    this.pengeluaran,
    this.laba,
    this.isLaba = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12.0),
            if (isLaba) ...[
              Text(
                "Rp $laba",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ] else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Pendapatan", style: TextStyle(fontSize: 14)),
                  Text(
                    "Rp $pendapatan",
                    style: const TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Pengeluaran", style: TextStyle(fontSize: 14)),
                  Text(
                    "Rp $pengeluaran",
                    style: const TextStyle(fontSize: 14, color: Colors.red),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}