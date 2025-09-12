class Order {
  final String id;
  final String nama;
  final String telepon;
  final String layanan;
  final double berat;
  final int harga;
  final String status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.nama,
    required this.telepon,
    required this.layanan,
    required this.berat,
    required this.harga,
    required this.status,
    required this.createdAt,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      nama: map['nama'] ?? '',
      telepon: map['telepon'] ?? '',
      layanan: map['layanan'] ?? '',
      berat: (map['berat'] ?? 0).toDouble(),
      harga: (map['harga'] ?? 0).toInt(),
      status: map['status'] ?? 'baru',
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'telepon': telepon,
      'layanan': layanan,
      'berat': berat,
      'harga': harga,
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
