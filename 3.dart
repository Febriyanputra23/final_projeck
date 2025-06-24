class AntrianPesananKue {
  final List<Map<String, dynamic>> _pesanan = [];

  // Method untuk menambahkan pesanan baru ke antrian
  void tambah(Map<String, dynamic> pesanan) {
    _pesanan.add(pesanan); // (Enqueue) Menambahkan ke akhir list
  }

  // Method untuk memproses pesanan pertama dalam antrian (FIFO)
  void proses() {
    if (_pesanan.isEmpty) {
      print('Antrian pesanan kosong');
      return;
    }

    // Mengambil dan menghapus pesanan pertama
    var pesanan = _pesanan.removeAt(0);

    // Menampilkan detail pesanan yang diproses
    print('\n=== PROSES PESANAN ===');
    print('Pelanggan : ${pesanan['pelanggan']}');
    print('Alamat    : ${pesanan['alamat']}');
    print('Kue       : ');

    // Menampilkan setiap item kue dalam pesanan
    for (var item in pesanan['items']) {
      print(
        '  • ${item['kue']} ${item['jumlah']} x @Rp${item['harga'].toStringAsFixed(0)}',
      );
    }

    // Menampilkan total harga dengan format tanpa desimal
    print('Total     : Rp${pesanan['total'].toStringAsFixed(0)}');

    // Menampilkan diskon jika ada
    if (pesanan['diskon'] > 0) {
      print('Diskon    : ${pesanan['diskon'] * 100}%');
    }
    print('======================');
  }

  // Method untuk menampilkan semua pesanan dalam antrian
  void tampilkan() {
    if (_pesanan.isEmpty) {
      print('Tidak ada pesanan dalam antrian');
      return;
    }
    print('\nDaftar Antrian Pesanan:');

    // Menampilkan setiap pesanan dengan nomor urut
    for (var i = 0; i < _pesanan.length; i++) {
      var p = _pesanan[i];
      // Baris utama pesanan
      print('${i + 1}. ${p['pelanggan']} - Total: Rp${p['total']}');

      // Detail item kue dalam pesanan
      for (var item in p['items']) {
        print('   • ${item['kue']} x${item['jumlah']} @Rp${item['harga']}');
      }
    }
  }
}
