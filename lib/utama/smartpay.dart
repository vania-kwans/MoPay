import 'package:flutter/material.dart';

class SmartPay extends StatefulWidget {
  const SmartPay({super.key});

  @override
  State<SmartPay> createState() => _SmartPayState();
}

class _SmartPayState extends State<SmartPay> {
  bool On_off = false ;
  bool On_off2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: ([ Color(0xffFEA1A1),Color(0xff850000)]),
            )
          ),
          child: Center(
            child: Text("SmartPay" , style: TextStyle(color: Colors.white),),
          )
        ),
      ),
      body: Container(
        color: Colors.grey[300],
      child:SingleChildScrollView(
    child:
      Column(
        children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: ([Color(0xffFEA1A1),Color(0xff850000)]))
        ) ,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 120 , right: 100 , top: 30),
                          padding: EdgeInsets.all(10),
                          height: 300,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoo3Rbb1Irb3D-j_Z5fCqzFd4QkZyNGWgbGQ&s"),
                              ),
                              Text("Sistem Pembayaran" , style: TextStyle(fontSize: 20),),
                              Text("Otomatis", style: TextStyle(fontSize: 20)),
                              SizedBox(height: 10),
                              Text("Kami akan memberikan rekomendasi ", style: TextStyle(fontSize: 12 , color: Colors.grey)),
                              Text("metode pembayaran jika Saldo MoPay" , style: TextStyle(fontSize: 12, color: Colors.grey)),
                              Text("tidak cukup disemua transaksi" , style: TextStyle(fontSize: 12 , color: Colors.grey))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 120 , left: 100 , top: 30),
                          padding: EdgeInsets.all(10),
                          height: 300,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnYZUZwKrjB0TFlcSeqhIzlrl34Q4PRuPLgGKaNrpVw3-s-hRSs0AkNvpyHn4qBb2z9EA&usqp=CAU")
                            ),
                            SizedBox(height: 20),
                            Text("Verifikasi dengan PIN" , style: TextStyle(fontSize: 20),),
                            SizedBox(height: 10),
                            Text("Keamanan berlapis disetiap transaksi", style: TextStyle(fontSize: 12 , color: Colors.grey)),
                            Text("dengan menggunakan PIN" , style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        )
                      ],
                    ),
      ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 2, backgroundColor: Colors.white,),
                  SizedBox(width: 5),
                  CircleAvatar(radius: 2, backgroundColor: Colors.white,)
                ],
              )
    ])
      ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
              child: Column(
              children: [
                    SwitchListTile(
                        value: On_off,
                        onChanged: (bool val){
                      setState(() {
                        On_off = val;
                      });
                    },
                      
                        title: Text('Sistem Pembayaran Otomatis'),
                        subtitle: Text("Kami akan memeberikan rekomendasi metode pembayaran anda"),
                      secondary: Icon(Icons.payments_outlined),
                        activeTrackColor: Color(0xff850000),
                        activeColor: Colors.white,),
                SizedBox(height: 20),
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),
                SizedBox(height: 20),
                SwitchListTile(
                  value: On_off2,
                  onChanged: (bool val){
                    setState(() {
                      On_off2 = val;
                    });
                  },
                  title: Text("Verifikasi Dengan PIN"),
                  subtitle: Text("Keamanan Berlapis Dengan PIN"),
                  secondary: Icon(Icons.lock_outline_rounded),
                      activeTrackColor: Color(0xff850000),
                      activeColor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("MOPAY PROTECTION" , style: TextStyle(color: Colors.grey , fontSize: 10),),
                        Icon(Icons.arrow_forward_ios , color: Colors.grey, size: 10,)],
                    )
            ])

          )
    ])
      )
      )
    );
  }
}
