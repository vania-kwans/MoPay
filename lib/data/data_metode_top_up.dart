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

class TopUpBankProvider extends ChangeNotifier {
  List<TopUpBank> data = [
    TopUpBank(
      linkGambar: 'assets/images/logo-bca.JPG',
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
      linkGambar: 'assets/images/logo-bri.jpg',
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
      linkGambar: 'assets/images/logo-mandiri.jpg',
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
      linkGambar: 'assets/images/logo-maybank.jpeg',
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
      linkGambar: 'assets/images/logo-bni.jpg',
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
      linkGambar: 'assets/images/logo-cimb-niaga.png',
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
