import 'dart:io'; // Untuk input/output
import '1.dart'; // Import kelas Pelanggan
import '2.dart'; // Import kelas Kue
import '3.dart'; // Import kelas AntrianPesananKue

void main() {
  // Inisialisasi daftar kue dengan 4 jenis kue default
  List<Kue> daftarKue = [
    Kue('Kastengel', 35000, 'kering'), // Kue 1
    Kue('Nastar', 40000, 'kering'), // Kue 2
    Kue('Putri Salju', 45000, 'kering'), // Kue 3
    Kue('Brownies', 30000, 'basah'), // Kue 4
  ];

  // Membuat objek antrian pesanan
  AntrianPesananKue antrian = AntrianPesananKue();

  print('=== SISTEM PESANAN KUE ===');

  // Loop utama program
  while (true) {
    // Menampilkan menu utama
    print('\nMenu Utama:');
    print('1. Tampilkan Daftar Kue');
    print('2. Tambah Pesanan Baru');
    print('3. Proses Pesanan');
    print('4. Tampilkan Antrian');
    print('5. Keluar');
    stdout.write('Pilih menu: '); // stdout.write untuk input tanpa newline

    var pilihan = stdin.readLineSync(); // Membaca input pengguna

    // Pilihan 1: Menampilkan daftar kue
    if (pilihan == '1') {
      print('\nDaftar Kue Tersedia:');
      for (var i = 0; i < daftarKue.length; i++) {
        stdout.write('${i + 1}. '); // Nomor urut
        daftarKue[i].tampilkan(); // Menampilkan detail kue
      }
    }
    // Pilihan 2: Membuat pesanan baru
    else if (pilihan == '2') {
      // Input data pelanggan
      print('\n=== DATA PELANGGAN ===');
      stdout.write('Nama Pelanggan: ');
      String? nama = stdin.readLineSync();

      stdout.write('Alamat Pengiriman: ');
      String? alamat = stdin.readLineSync();

      stdout.write('Pelanggan Langganan? (y/n): ');
      bool isLangganan = stdin.readLineSync()?.toLowerCase() == 'y';

      // Menentukan diskon (10% jika langganan)
      double diskon = isLangganan ? 0.1 : 0.0;

      // Membuat objek pelanggan
      var pelanggan = Pelanggan(
        nama ?? 'Tanpa Nama', // Kosong jika tidak di isi
        alamat ?? 'Tanpa Alamat', // Kosong jika tidak di isi
        isLangganan: isLangganan,
        diskon: diskon,
      );

      pelanggan.tampilkan();

      // Proses pemilihan kue
      List<Map<String, dynamic>> items = [];

      while (true) {
        print('\nPilih Kue:');
        // Menampilkan daftar kue dengan nomor urut
        for (var i = 0; i < daftarKue.length; i++) {
          stdout.write('${i + 1}. ');
          daftarKue[i].tampilkan();
        }

        stdout.write('Pilih nomor kue (0 untuk selesai): ');
        var pilihKue = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        // Keluar dari loop jika memilih 0
        if (pilihKue == 0) break;

        // Validasi input
        if (pilihKue < 1 || pilihKue > daftarKue.length) {
          print('Pilihan tidak valid!');
          continue;
        }

        // Mendapatkan kue yang dipilih
        var kue = daftarKue[pilihKue - 1];
        stdout.write('Jumlah pesan ${kue.nama}: ');
        var jumlah = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        // Validasi jumlah
        if (jumlah <= 0) {
          print('Jumlah harus lebih dari 0');
          continue;
        }

        // Hitung total dengan diskon
        double total = kue.harga * jumlah * (1 - diskon);

        // Tambahkan ke items pesanan
        items.add({
          'kue': kue.nama,
          'jumlah': jumlah,
          'harga': kue.harga,
          'total': total,
        });

        print('${kue.nama} x$jumlah ditambahkan ke pesanan');
      }

      // Jika ada item yang dipesan
      if (items.isNotEmpty) {
        // Hitung total semua item
        double totalPesanan = items.fold(0, (sum, item) => sum + item['total']); //iterasi 1: sum = 0 + 70000 → 70000 Iterasi 2: sum = 70000 + 90000 → 160000
        // fold method yang dimiliki oleh List di Dart

        // Tambahkan ke antrian
        antrian.tambah({
          'pelanggan': pelanggan.nama,
          'alamat': pelanggan.alamat,
          'items': items,
          'total': totalPesanan,
          'diskon': diskon,
        });

        // Notifikasi ke pengguna
        print('\nPesanan dari ${pelanggan.nama} berhasil dibuat!');
        print('Total Pesanan: Rp$totalPesanan');
        if (diskon > 0) {
          print('Anda mendapatkan diskon ${diskon * 100}%');
        }
      } else {
        print('Tidak ada pesanan yang ditambahkan');
      }
    }
    // Pilihan 3: Memproses pesanan berikutnya
    else if (pilihan == '3') {
      antrian.proses();
    }
    // Pilihan 4: Menampilkan antrian pesanan
    else if (pilihan == '4') {
      antrian.tampilkan();
    }
    // Pilihan 5: Keluar dari program
    else if (pilihan == '5') {
      print('Terima kasih!');
      break;
    }
    // Input tidak valid
    else {
      print('Pilihan tidak valid');
    }
  }
}
