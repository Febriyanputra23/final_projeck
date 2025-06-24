class Pelanggan {
  // Deklarasi variabel instance
  String nama; // Menyimpan nama pelanggan
  String alamat; // Menyimpan alamat pengiriman
  bool isLangganan; // Status langganan (true untuk langganan)
  double diskon; // Persentase diskon (0.0 - 1.0)

  // Constructor dengan parameter wajib dan opsional
  Pelanggan(
    this.nama, // Parameter wajib: nama
    this.alamat, { // Parameter wajib: alamat
    this.isLangganan = false, // Parameter opsional dengan default false
    this.diskon = 0.0, // Parameter opsional dengan default 0.0
  });

  // Method untuk menampilkan informasi pelanggan
  void tampilkan() {
    if (isLangganan) {
      // Format tampilan untuk pelanggan langganan dengan emoji bintang
      print(' $nama (Langganan) - Alamat: $alamat - Diskon: ${diskon * 100}%');
    } else {
      // Format tampilan untuk pelanggan biasa dengan emoji orang
      print(' $nama - Alamat: $alamat');
    }
  }
}
