import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/fitur_pbb/pembayaranPbb.dart';

class PajakPbb extends StatefulWidget {
  const PajakPbb({super.key});

  @override
  State<PajakPbb> createState() => _PajakPbbState();
}

class _PajakPbbState extends State<PajakPbb> {
  TextEditingController _pbb = TextEditingController();
  List<daftarkota> find =[...kota] ;

  void filters(String keyword){
    setState(() {
      find = kota.where((city) => city.namakota.contains(keyword)).toList();
    })
    ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pajak PBB"),
      ),
      body:Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: filters,
              controller: _pbb,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE78895)),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE78895)),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "cari pajak pbb",
                  filled: true,
                  fillColor: Color(0xFFE78895)

              ),

            ),
            Expanded(
                child: ListView.builder(
                    itemCount: find.length,
                    itemBuilder: (context ,index){
                      return GestureDetector(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage("https://i0.wp.com/fahum.umsu.ac.id/wp-content/uploads/2023/06/partai-bulan-bintang.jpg?fit=1366%2C768&ssl=1"),
                          ),
                          title: Text(find[index].namakota),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        onTap: (){
                          final namakota = find[index].namakota;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PembayaranPBB(namakota: namakota),));
                        },
                      );

                    }))
          ],
        ),
      ),

    );
  }
}


class daftarkota{
  String namakota;

  daftarkota({
    required this.namakota
  });

}

List<daftarkota> kota = [
  daftarkota(
      namakota: "Humbang Hasundutan"),
  daftarkota(
      namakota: "PBB Kab Alor"),
  daftarkota(
      namakota: "PBB Kab Asahan"),
  daftarkota(
      namakota: "PBB Kab Balangan"),
  daftarkota(
      namakota: "PBB Kab Bandung"),
  daftarkota(
      namakota: "PBB Kab Bandung Barat"),
  daftarkota(
      namakota: "PBB Kab  Banjar"),
  daftarkota(
      namakota: "PBB Kab Banjarnegara"),
  daftarkota(namakota: "PBB Kab Bantaeng"),
  daftarkota(namakota: "PBB Kab Banyumas"),
  daftarkota(namakota: "PBB Kab Banyuwangi"),
  daftarkota(namakota: "PBB Kab Barito Kuala"),
  daftarkota(namakota: "PBB Kab Barru"),
  daftarkota(namakota: "PBB Kab Batang"),
  daftarkota(namakota: "PBB Kab Batu Bara"),
  daftarkota(namakota: "PBB Kab Bekasi"),
  daftarkota(namakota: "PBB Kab Belu"),
  daftarkota(namakota: "PBB Kab Bengkalis"),
  daftarkota(namakota: "PBB Kab Berau"),
  daftarkota(namakota: "PBB Kab Bima"),
  daftarkota(namakota: "PBB Kab Bintan"),
  daftarkota(namakota: "PBB Kab Blitar"),
  daftarkota(namakota: "PBB Kab Blora"),


];