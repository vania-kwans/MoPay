import 'package:flutter/material.dart';
class PembayaranPBB extends StatefulWidget {
  final namakota ;
  const PembayaranPBB({super.key , required this.namakota});

  @override
  State<PembayaranPBB> createState() => _PembayaranPBBState();
}

class _PembayaranPBBState extends State<PembayaranPBB> {
  List<Tahun> year = [...years];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pajak PBB"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.namakota , style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 30),
            Text("Nomor Objek Pajak" , style: TextStyle(fontSize: 10 , color: Colors.grey),),
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
            SizedBox(height: 30),
            Text("Tahun Pembayaran" , style: TextStyle(fontSize: 10 , color: Colors.grey)),
            SizedBox(height: 10),
            DropdownButtonFormField(
              items: year.map((e) => DropdownMenuItem(
                value: e.Year,
                child: Text(e.Year.toString()),
              )).toList(),
              onChanged: (value){
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "Tahun"
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
            child: Text("Lanjut Ke Pembayaran")),
      ),
    );
  }
}


class Tahun{
  int Year ;

  Tahun({
    required this.Year
  });
}

List<Tahun> years =[
  Tahun(Year: 2015),
  Tahun(Year: 2016),
  Tahun(Year: 2017),
  Tahun(Year: 2018),
  Tahun(Year: 2019),
  Tahun(Year: 2020),
  Tahun(Year: 2021),
  Tahun(Year: 2022),
  Tahun(Year: 2023),
  Tahun(Year: 2024)
];
