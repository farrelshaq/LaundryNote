import 'package:get/get.dart';

class PelangganController extends GetxController {
  var pelangganList = <String>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    pelangganList.addAll(['Ibu Sari', 'Pak Budi']);
  }

  List<String> get filteredPelanggan {
    if (searchQuery.value.isEmpty) {
      return pelangganList;
    } else {
      return pelangganList
          .where((nama) => nama.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void tambahPelanggan(String nama) {
    pelangganList.add(nama);
  }

  void hapusPelanggan(int index) {
    pelangganList.removeAt(index);
  }

  void searchPelanggan(String value) {
    searchQuery.value = value;
  }
}
