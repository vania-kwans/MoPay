import 'package:flutter/material.dart';
class Bpjs extends StatefulWidget {
  const Bpjs({super.key });

  @override
  State<Bpjs> createState() => _Bpjstate();
}

class _Bpjstate extends State<Bpjs> {
  List<BulanPembayarn> bulanpembayaran = [...month];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BPJS"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://awsimages.detik.net.id/community/media/visual/2019/10/07/b4762655-81af-45a1-ba91-8fea1fa19667_169.jpeg?w=600&q=90"),
                ),
                SizedBox(width: 10),
                Text("BPJS Kesehatan" , style: TextStyle(fontWeight: FontWeight.bold) ,)
              ],
            ),
            SizedBox(height: 30),
            Text("Nomor BPJS" , style: TextStyle(fontSize: 10 , color: Colors.grey),),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF850000)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF850000)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  filled: true,
                  fillColor: Color(0xFF850000),
                  hintText: "Contoh 4506000000",
                  hintStyle: TextStyle(color: Colors.white,
                  )),
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30),
            Text("Sampai Dengan" , style: TextStyle(fontSize: 10 , color: Colors.grey)),
            SizedBox(height: 10),
            DropdownButtonFormField(
              items: month.map((e) => DropdownMenuItem(
                value: e.Bulan,
                child: Text(e.Bulan.toString()),
              )).toList(),
              onChanged: (value){
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF850000)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF850000)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  filled: true,
                  hintText: "Pilih Bulan"
              ),)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(50)
            ),
            child: Text("Lanjutkan" , style: TextStyle(color: Color(0xFF850000)),)),
      ),
    );
  }
}


class BulanPembayarn {
  String Bulan ;

  BulanPembayarn({
    required this.Bulan
  });
}

List<BulanPembayarn> month = [
  BulanPembayarn(Bulan: "Juli 2024" ),
  BulanPembayarn(Bulan: "Agustus 2024"),
  BulanPembayarn(Bulan: "September 2024"),
  BulanPembayarn(Bulan: "November 2024"),
  BulanPembayarn(Bulan: "Desember 2024"),
  BulanPembayarn(Bulan: "Januari 2025"),
  BulanPembayarn(Bulan: "Febuary 2025"),
  BulanPembayarn(Bulan: "Maret 2025"),
  BulanPembayarn(Bulan: "April 2025")
];