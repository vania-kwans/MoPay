

import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:provider/provider.dart';

class TagihanListrik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Tagihan Listrik",
                style: TextStyle(color: Colors.black),
              ),
              background: Image.network(
                "https://png.pngtree.com/png-clipart/20230824/original/pngtree-professional-electricians-workers-do-necessary-electrical-installation-picture-image_8450855.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: GridHarga(),
            ),
          ),
        ],
      ),
    );
  }
}

class GridHarga extends StatefulWidget {
  @override
  _GridHargaState createState() => _GridHargaState();
}

class _GridHargaState extends State<GridHarga> {
  final TextEditingController _noToken = TextEditingController();
  bool _isButtonEnabled = false;
  Pelanggan? find;

  void finds(String keyword) {
    setState(() {
      find = DataPelanggan.firstWhere(
            (pelanggan) => pelanggan.IdPelanggan.contains(keyword),
        orElse: () => Pelanggan(
          nomorMeter: '',
          IdPelanggan: '',
          Nama: '',
          DayaTarif: '',
          Iuran: 0,
          Admin: 0,
        ),
      );
      if (find!.IdPelanggan.isEmpty) {
        find = null;
      }
    });
  }

  void _checkInput() {
    setState(() {
      if (_noToken.text.length >= 10) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (find != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informasi Pelanggan",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nomor Meter"),
                            Text(find!.nomorMeter),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Id Pelanggan"),
                            Text(find!.IdPelanggan),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nama Pelanggan"),
                            Text(find!.Nama),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tarif/Daya"),
                            Text(find!.DayaTarif),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 5,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Detail Pembayaran",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tagihan"),
                            Text("Rp. ${find!.Iuran}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Biaya Admin"),
                            Text("Rp. ${find!.Admin}"),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 30,
                        endIndent: 30,
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Pembayaran",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Rp. ${find!.Iuran + find!.Admin}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Ubah"),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size.fromHeight(50),
                                backgroundColor: Colors.grey[300],
                                foregroundColor: Color(0xFF850000),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                MopayUserData currentUser =
                                Provider.of<MopayUserDataProvider>(context,
                                    listen: false)
                                    .currentUser!;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Nama:"),
                                          Text(currentUser.nama),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Lanjut",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size.fromHeight(50),
                                backgroundColor: Color(0xFF850000),
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                if (find == null)
                  Image(
                      image: NetworkImage(
                          "https://static.vecteezy.com/system/resources/previews/016/026/432/original/user-not-found-account-not-register-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg")),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _noToken.addListener(_checkInput);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Nomor Meteran",
          textAlign: TextAlign.start,
        ),
        TextField(
          onChanged: finds,
          controller: _noToken,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: "Contoh 1234567890",
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isButtonEnabled ? _showBottomSheet : null,
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.grey[300],
              backgroundColor: Color(0xFF850000)),
          child: Text(
            'Lanjutkan',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        // SizedBox(height: 20),
        // _showGridView ? _buildGridView() : Container(),
      ],
    );
  }
}

class Pilihan {
  int harga;
  int admin;

  Pilihan({required this.harga, required this.admin});
}

List<Pilihan> PilihanPembelian = [
  Pilihan(harga: 20000, admin: 2500),
  Pilihan(harga: 50000, admin: 2500),
  Pilihan(harga: 100000, admin: 2500),
  Pilihan(harga: 200000, admin: 2750),
  Pilihan(harga: 500000, admin: 2750),
  Pilihan(harga: 1000000, admin: 2750),
  Pilihan(harga: 5000000, admin: 2750),
  Pilihan(harga: 10000000, admin: 2750)
];

class Pelanggan {
  String nomorMeter;
  String IdPelanggan;
  String Nama;
  String DayaTarif;
  int Iuran;
  int Admin;

  Pelanggan({
    required this.nomorMeter,
    required this.IdPelanggan,
    required this.Nama,
    required this.DayaTarif,
    required this.Iuran,
    required this.Admin,
  });
}

List<Pelanggan> DataPelanggan = [
  Pelanggan(
      nomorMeter: "5678901234",
      IdPelanggan: "1234567890",
      Nama: "elly",
      DayaTarif: "R2M/000000200VA",
      Iuran: 500000,
      Admin: 2500),
  Pelanggan(
      nomorMeter: "1234567890",
      IdPelanggan: "12345432123",
      Nama: "christine",
      DayaTarif: "RM3/000000250VA",
      Iuran: 400000,
      Admin: 2500),
  Pelanggan(
      nomorMeter: "56786545678",
      IdPelanggan: "12343218900",
      Nama: "Vania",
      DayaTarif: "R4M/000000300VA",
      Iuran: 499000,
      Admin: 2500)
];