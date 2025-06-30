import 'package:flutter/material.dart';

class TopUpBank {
  String linkGambar;
  String namaBank;
  String kodePerusahaan;
  List<TipeLayananBank> tipeLayanan;

  TopUpBank({
    required this.linkGambar,
    required this.namaBank,
    required this.kodePerusahaan,
    required this.tipeLayanan,
  });
}

class TipeLayananBank {
  String nama;
  bool showVirtualAccountNumber;
  String biayaAdmin;
  String minimumTopUp;
  List<String> instruksi;

  TipeLayananBank({
    required this.nama,
    required this.showVirtualAccountNumber,
    required this.biayaAdmin,
    required this.minimumTopUp,
    required this.instruksi,
  });
}

class TopUpTunai {
  String linkGambar;
  String nama;
  String biayaAdmin;
  String minimumTopUp;
  bool bisaPesan;
  List<String> instruksi;

  TopUpTunai({
    required this.linkGambar,
    required this.nama,
    required this.biayaAdmin,
    required this.minimumTopUp,
    required this.bisaPesan,
    required this.instruksi,
  });
}

class TopUpBankProvider extends ChangeNotifier {
  List<TopUpBank> data = [
    TopUpBank(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-bca.JPG',
      namaBank: "BCA",
      kodePerusahaan: '70001',
      tipeLayanan: [
        TipeLayananBank(
          nama: 'm-banking',
          showVirtualAccountNumber: true,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Masukkan kartu ATM dan PIN kamu.',
            'Masuk ke menu TRANSFER dan klik BCA Virtual Account.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'Internet banking',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Login ke KLIK BCA.',
            'Pilih FUND TRANSFER > TRANSFER TO BCA VIRTUAL ACCOUNT.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'ATM',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Masukkan kartu ATM dan PIN kamu.',
            'Masuk ke menu TRANSFER dan klik BCA Virtual Account.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'BCA OneKlik',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: '0',
          instruksi: [
            'Pilih Isi Saldo lalu pilih tab Instan.',
            'Masukkan jumlah saldo MoPay yang mau diisi.',
            'Pilih kartu BCA yang mau dipakai atau tambah kartu baru.',
            'Klik LANJUT.',
            'Konfirmasi pembayaranmu lalu pilih KONFIRMASI & BAYAR.',
            'Masukkan PIN MoPay kamu.',
            'Setelah berhasil isi saldo, kamu bakap dapat notifikasi kalau saldo MoPay kamu udah bertambah.'
          ],
        ),
        TipeLayananBank(
          nama: 'BCA - SIM Toolkit',
          showVirtualAccountNumber: true,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Pilih m-BCA.',
            'Pilih m-PAYMENT > OTHERS/LAINNYA.',
            'PIlih TVA lalu tekan OK.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Masukkan PIN BCA kamu lalu tekan OK.',
            'Kamu akan menerima SMS konfirmasi.'
          ],
        ),
      ],
    ),
    TopUpBank(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-bri.jpg',
      namaBank: "BRI",
      kodePerusahaan: '301341',
      tipeLayanan: [
        TipeLayananBank(
          nama: 'm-banking',
          showVirtualAccountNumber: true,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: <String>[
            'Login ke BRImo.',
            'Pilih Dompet Digital > MoPay > Customer.',
            'Masukkan nomor HP yang terdaftar pada aplikasi MoPay.',
            'Masukkan jumlah saldo Mopay yang ingin diisi.',
            'Masukkan PIN untuk memverifikasi transaksi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan prosses pengisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'ATM',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: <String>[
            'Masukkan kartu ATM dan PIN kamu.',
            'Masuk ke menu TRANSAKSI LAINNYA dan klik PEMBELIAN.',
            'Pilih TOP UP MoPay, masukkan kode perusahaan MoPay: 301341 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 3013410851XXXXXXX)',
            'Masukkan jumlah saldo MoPay yang ingin diisi',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
      ],
    ),
    TopUpBank(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-mandiri.jpg',
      namaBank: "Mandiri",
      kodePerusahaan: '60737',
      tipeLayanan: [
        TipeLayananBank(
          nama: 'Livin\' by Mandiri',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp15.000',
          instruksi: <String>[
            'Login ke Livin\' by Mandiri.',
            'Pilih Bayar > Buat Pembayaran Baru > Multipayment > MoPay Customer.',
            'Masukkan nomor HP yang terdaftar pada aplikasi MoPay.',
            'Masukkan jumlah saldo Mopay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan prosses pengisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'Internet Banking',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp15.000',
          instruksi: <String>[
            'Login ke Mandiri Internet Banking.',
            'Pilih menu BAYAR > MULTI PAYMENT > SERVICE PROVIDERS.',
            'Pilih MoPay CUSTOMER.',
            'Masukkan nomor HP-mu yang terdaftar pada aplikasi MoPay.',
            'Masukkan jumlah saldo Mopay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan prosses pengisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'ATM',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp15.000',
          instruksi: <String>[
            'Masukkan kartu ATM dan PIN kamu',
            'Masuk ke menu BAYAR/BELI > LAINNYA > LAINNYA > pilih e-Commerce.',
            'Masukkan kode perusahaan untuk MoPay: 60737.',
            'Masukkan nomor HP-mu yang terdaftar pada aplikasi MoPay.',
            'Masukkan jumlah saldo Mopay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan prosses pengisian saldo MoPay.'
          ],
        ),
      ],
    ),
    TopUpBank(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-maybank.jpeg',
      namaBank: "Maybank",
      kodePerusahaan: '2002',
      tipeLayanan: [
        TipeLayananBank(
          nama: 'm-banking',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp2.000',
          minimumTopUp: 'Rp10.000',
          instruksi: <String>[
            'Login ke Maybank2u dari HP kamu.',
            'Klik icon Rekening & Transaksi, lalu pilih Transfer.',
            'Klik Transfer E-Money.',
            'Pilih MoPay pada Nama Produk',
            'Masukkan nomor telepon yang terdaftar pada aplikasi MoPay pada kolom Nomor (contoh: 0812XXXXXXX).',
            'Masukkan jumlah saldo Mopay yang ingin diisi pada kolom Jumlah.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan prosses pengisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'Internet Banking',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp2.000',
          minimumTopUp: 'Rp10.000',
          instruksi: <String>[
            'Login ke Maybank2u.',
            'Klik icon Rekening & Transaksi, lalu pilih Transfer.',
            'Klik Transfer E-Money.',
            'Pilih MoPay pada Nama Produk',
            'Masukkan nomor telepon yang terdaftar pada aplikasi MoPay pada kolom Nomor (contoh: 0812XXXXXXX).',
            'Masukkan jumlah saldo Mopay yang ingin diisi pada kolom Jumlah.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan prosses pengisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'ATM',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp2.000',
          minimumTopUp: 'Rp10.000',
          instruksi: <String>[
            'Masukkan kartu ATM dan PIN kamu',
            'Masuk ke menu TRANSFER > E-MONEY LAINNYA.',
            'Masukkan kode untuk memilih jenis isi MoPay: 2002.',
            'Masukkan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 0812XXXXXXX).',
            'Masukkan jumlah saldo Mopay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan prosses pengisian saldo MoPay.'
          ],
        ),
      ],
    ),
    TopUpBank(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-bni.jpg',
      namaBank: "BNI",
      kodePerusahaan: '70001',
      tipeLayanan: [
        TipeLayananBank(
          nama: 'm-banking',
          showVirtualAccountNumber: true,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Masukkan kartu ATM dan PIN kamu.',
            'Masuk ke menu TRANSFER dan klik BCA Virtual Account.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'Internet banking',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Login ke KLIK BCA.',
            'Pilih FUND TRANSFER > TRANSFER TO BCA VIRTUAL ACCOUNT.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'ATM',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Masukkan kartu ATM dan PIN kamu.',
            'Masuk ke menu TRANSFER dan klik BCA Virtual Account.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'BCA OneKlik',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: '0',
          instruksi: [
            'Pilih Isi Saldo lalu pilih tab Instan.',
            'Masukkan jumlah saldo MoPay yang mau diisi.',
            'Pilih kartu BCA yang mau dipakai atau tambah kartu baru.',
            'Klik LANJUT.',
            'Konfirmasi pembayaranmu lalu pilih KONFIRMASI & BAYAR.',
            'Masukkan PIN MoPay kamu.',
            'Setelah berhasil isi saldo, kamu bakap dapat notifikasi kalau saldo MoPay kamu udah bertambah.'
          ],
        ),
        TipeLayananBank(
          nama: 'BCA - SIM Toolkit',
          showVirtualAccountNumber: true,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Pilih m-BCA.',
            'Pilih m-PAYMENT > OTHERS/LAINNYA.',
            'PIlih TVA lalu tekan OK.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Masukkan PIN BCA kamu lalu tekan OK.',
            'Kamu akan menerima SMS konfirmasi.'
          ],
        ),
      ],
    ),
    TopUpBank(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-cimb-niaga.png',
      namaBank: "CIMB Niaga",
      kodePerusahaan: '70001',
      tipeLayanan: [
        TipeLayananBank(
          nama: 'm-banking',
          showVirtualAccountNumber: true,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Masukkan kartu ATM dan PIN kamu.',
            'Masuk ke menu TRANSFER dan klik BCA Virtual Account.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'Internet banking',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Login ke KLIK BCA.',
            'Pilih FUND TRANSFER > TRANSFER TO BCA VIRTUAL ACCOUNT.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'ATM',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Masukkan kartu ATM dan PIN kamu.',
            'Masuk ke menu TRANSFER dan klik BCA Virtual Account.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses penyisian saldo MoPay.'
          ],
        ),
        TipeLayananBank(
          nama: 'BCA OneKlik',
          showVirtualAccountNumber: false,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: '0',
          instruksi: [
            'Pilih Isi Saldo lalu pilih tab Instan.',
            'Masukkan jumlah saldo MoPay yang mau diisi.',
            'Pilih kartu BCA yang mau dipakai atau tambah kartu baru.',
            'Klik LANJUT.',
            'Konfirmasi pembayaranmu lalu pilih KONFIRMASI & BAYAR.',
            'Masukkan PIN MoPay kamu.',
            'Setelah berhasil isi saldo, kamu bakap dapat notifikasi kalau saldo MoPay kamu udah bertambah.'
          ],
        ),
        TipeLayananBank(
          nama: 'BCA - SIM Toolkit',
          showVirtualAccountNumber: true,
          biayaAdmin: 'Rp1.000',
          minimumTopUp: 'Rp10.000',
          instruksi: [
            'Pilih m-BCA.',
            'Pilih m-PAYMENT > OTHERS/LAINNYA.',
            'PIlih TVA lalu tekan OK.',
            'Masukkan kode perusahaan untuk MoPay: 70001 dan nomor HP-mu yang terdaftar pada aplikasi MoPay (contoh: 7000010812XXXXXX).',
            'Masukkan jumlah saldo MoPay yang ingin diisi.',
            'Masukkan PIN BCA kamu lalu tekan OK.',
            'Kamu akan menerima SMS konfirmasi.'
          ],
        ),
      ],
    ),
  ];
}

class TopUpTunaiProvider extends ChangeNotifier {
  List<TopUpTunai> data = [
    TopUpTunai(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-indomaret.jpg',
      nama: 'Indomaret',
      biayaAdmin: 'Rp1.500',
      minimumTopUp: 'Rp10.000',
      bisaPesan: true,
      instruksi: [
        'Buka aplikasi MoPay dan klik ikon + (Top up) di halaman utama.',
        'Pilih metode top up pakai uang tunai.',
        'Pilih Indomaret lalu isi nominal top up.',
        'Klik Lanjut untuk mendapatkan barcode.',
        'Sampaikan kepada kasir Indomaret untuk melakukan pembayaran ke MoPay.',
        'Tunjukkan kode diatas ke kasir.',
        'Bayar jumlah nominal top up plus biaya admin Rp1.500 dalam waktu 24 jam.',
        'Saldo akan diterima dalam waktu kurang dari 24 jam.',
        'Simpan struk sampai top up berhasil dan pakai buat bukti jika dibutuhkan.'
      ],
    ),
    TopUpTunai(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-alfamart.jpg',
      nama: 'Alfamart',
      biayaAdmin: 'Rp2.000',
      minimumTopUp: 'Rp10.000',
      bisaPesan: false,
      instruksi: [
        'Minta bantuan kasir untuk mengisi MoPay.',
        'Beritahu nomor HP yang kamu pakai di aplikasi MoPay.',
        'Beritahu nominal isi MoPay\n(pilih: Rp20.000, Rp50.000, Rp100.000, Rp200.000, Rp300.000, Rp400.000, Rp500.000).',
        'Bayar nominal yang ingin kamu isi ke kasir (plus biaya admin Rp2.000).',
        'Kasir akan mengisi saldo ke akun MoPay kamu.',
        'Pastikan saldo MoPay kamu sudah bertambah. Caranya, klik icon Riwayat di halaman utama.',
        'Simpan bukti pembayarannya.'
      ],
    ),
    TopUpTunai(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-lawson.jpg',
      nama: 'Lawson',
      biayaAdmin: 'Rp2.000',
      minimumTopUp: 'Rp10.000',
      bisaPesan: false,
      instruksi: [
        'Minta bantuan kasir untuk mengisi MoPay.',
        'Beritahu nomor HP yang kamu pakai di aplikasi MoPay.',
        'Beritahu nominal isi MoPay\n(pilih: Rp20.000, Rp50.000, Rp100.000, Rp200.000, Rp300.000, Rp400.000, Rp500.000).',
        'Bayar nominal yang ingin kamu isi ke kasir (plus biaya admin Rp2.000).',
        'Kasir akan mengisi saldo ke akun MoPay kamu.',
        'Pastikan saldo MoPay kamu sudah bertambah. Caranya, klik icon Riwayat di halaman utama.',
        'Simpan bukti pembayarannya.'
      ],
    ),
    TopUpTunai(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-atm-bersama.png',
      nama: 'ATM Bersama',
      biayaAdmin: 'Rp5.000 - Rp7.500',
      minimumTopUp: 'Rp20.000',
      bisaPesan: false,
      instruksi: [
        'Isi formulir setoran tunai.',
        'Sebagai rekening tujuan, tulis kode perusahaan untuk MoPay: 898 kemudian diikuti nomor HP-mu yang terdaftar pada MoPay (Contoh: 898 0812XXXXXX).',
        'Tulis nama penerima: Nama kamu yang terdaftar di aplikasi MoPay dan Bank Penerima.',
        'Masukkan jumlah top up yang diinginkan.',
        'Ikuti instruksi untuk menyelesaikan transaksi.'
      ],
    ),
    TopUpTunai(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-alfamidi.png',
      nama: 'Alfamidi',
      biayaAdmin: 'Rp2.000',
      minimumTopUp: 'Rp10.000',
      bisaPesan: false,
      instruksi: [
        'Minta bantuan kasir untuk mengisi MoPay.',
        'Beritahu nomor HP yang kamu pakai di aplikasi MoPay.',
        'Beritahu nominal isi MoPay\n(pilih: Rp20.000, Rp50.000, Rp100.000, Rp200.000, Rp300.000, Rp400.000, Rp500.000).',
        'Bayar nominal yang ingin kamu isi ke kasir (plus biaya admin Rp2.000).',
        'Kasir akan mengisi saldo ke akun MoPay kamu.',
        'Pastikan saldo MoPay kamu sudah bertambah. Caranya, klik icon Riwayat di halaman utama.',
        'Simpan bukti pembayarannya.'
      ],
    ),
    TopUpTunai(
      linkGambar:
          'https://storage.googleapis.com/mopay-assets/logo-mitra-top-up/logo-pos-indonesia.jpg',
      nama: 'Pos Indonesia',
      biayaAdmin: 'Rp2.000',
      minimumTopUp: 'Rp10.000',
      bisaPesan: false,
      instruksi: [
        'Minta bantuan petugas loket buat isi MoPay.',
        'Kasih tau nomor HP-mu dan jumlah MoPay yang ingin diisi ke petugas loket.',
        'Begitu petugasnya selesai, pastiin MoPay kamu udah bertambah. Caranya, klik icon Riwayat di halaman utama.'
      ],
    ),
  ];
}
