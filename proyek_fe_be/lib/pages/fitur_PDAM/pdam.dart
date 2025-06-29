import 'package:flutter/material.dart';

class Pdam extends StatefulWidget {
  const Pdam({super.key});

  @override
  State<Pdam> createState() => _PdamState();
}

class _PdamState extends State<Pdam> {
  final Tempat = [...tempat];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Air PDAM"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://media.istockphoto.com/id/1486225810/id/vektor/ilustrasi-vektor-konsep-tagihan-pdam-keran-air-tumpukan-koin-dan-faktur-dalam-desain-datar.jpg?s=1024x1024&w=is&k=20&c=3h9o30rDc9X4nzM5lR5rl7NmiCyGob25ZgbrZiiBUvY="),
                ),
                SizedBox(width: 10),
                Text('PDAM', style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 50),
            Text("Lokasi" , style: TextStyle(fontSize: 10 , color: Colors.grey)),
            SizedBox(height: 10),
            DropdownButtonFormField(
              items: Tempat.map((e) => DropdownMenuItem(
                  value: e.kota,
                  child: Row(
                    children: [
                      Text(e.kabupaten),
                      Text(" - "),
                      Text(e.kota)

                    ],
                  ))
              ).toList(),
              onChanged: (value){
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "Pilih Lokasi"
              ),),
            SizedBox(height: 30),
            Text("Nomor Pelanggan" , style: TextStyle(fontSize: 10 , color: Colors.grey),),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "Contoh 4506000000"
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(50)
            ),
            child: Text("Lanjut Ke Pembayaran")),
      ),
    );
  }
}

class lokasi{
  String kabupaten ;
  String kota ;

  lokasi({
    required this.kabupaten , required this.kota
  });
}

List<lokasi> tempat = [
  lokasi(
      kabupaten: "Sumatera",
      kota: "Kota Lubuk Linggau"),
  lokasi(
      kabupaten: "Kalimantan",
      kota: "Sampit"),
  lokasi(
      kabupaten: "Jawa Barat",
      kota: "Kota Cirebon"),
  lokasi(
      kabupaten: "Jawa Tengah",
      kota: "Kota Surakarta Solo"),
  lokasi(kabupaten: "Sumatera",
      kota: "Kota Pasaman")
];
