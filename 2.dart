class Kue {
  // Deklarasi variabel instance
  String nama; // Nama jenis kue
  double harga; // Harga per unit dalam Rupiah 
  String jenis; // Kategori kue (kering/basah)

  // Constructor dengan semua parameter wajib
  Kue(this.nama, this.harga,  this.jenis);

  // Method untuk menampilkan informasi kue
  void tampilkan() {
    // Menampilkan detail kue dalam satu baris
    print('$nama - Rp$harga - Jenis: $jenis');
  }
}
