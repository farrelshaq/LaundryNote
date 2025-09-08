import 'package:flutter/material.dart';

class PelangganWidget extends StatelessWidget {
  final String nama;
  final VoidCallback onDelete;

  const PelangganWidget({
    super.key,
    required this.nama,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(nama),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
