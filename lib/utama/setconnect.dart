import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // APPBAR PROFILE SETTINGS---------------------------------------------------------------------------------------------------------------------------
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace:
        Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [ Color(0xffFEA1A1),Color(0xff850000),],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        )
        ), child: Center(
          child: Text("Profile Settings" , style: TextStyle(color: Colors.white),),
        ),)),
      body: Container(
        color: Color(0xffEEEEEE),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),

        // FITUR TIPE AKUN DLL----------------------------------------------------------------------------------------------------
        child : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextButton(onPressed: (){}, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tipe Akun" , style: TextStyle(color: Colors.black),),
                            Row(
                              children: [
                                Text("MoPremium" , style: TextStyle(color: Colors.black) ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_ios ,color: Colors.grey[350],)
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 20),
                    TextButton(onPressed: (){}, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ganti Gambar Profile",  style: TextStyle(color: Colors.black)),
                            Row(
                              children: [
                                Icon(Icons.perm_identity , color: Colors.grey),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_ios , color: Colors.grey[350],)
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 20),
                    TextButton(onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Username", style: TextStyle(color: Colors.black)),
                            Row(
                              children: [
                                Text("Jennie" , style: TextStyle(color: Colors.black)),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_ios,color: Colors.grey[350],)
                              ])
                          ],
                        )),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 20),
                    TextButton(onPressed: (){}, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ubah Nomor Ponsel", style: TextStyle(color: Colors.black)),
                            Row(
                              children: [
                                Text("623491244" , style: TextStyle(color: Colors.black)),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_ios, color: Colors.grey[350],)
                              ])
                          ],
                        )),
                    SizedBox(height: 20)
                  ]),
              ),
              SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pembagian Feed" , style: TextStyle(color: Colors.black)),
                    Row(
                      children: [
                        Text('Pasang' , style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios , color: Colors.grey[350],)
                      ])
                  ]),
              ),
        ]),
        )
      )
    );
  }
}

// SECURITY SETTINGS -----------------------------------------------------------------------------------------------------------------------------
class SecuritySetting extends StatefulWidget {
  const SecuritySetting({super.key});

  @override
  State<SecuritySetting> createState() => _SecuritySettingState();
}

class _SecuritySettingState extends State<SecuritySetting> {
  bool On_off = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace:
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ Color(0xffFEA1A1),Color(0xff850000),],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ), child: Center(
            child: Text("Security Settings" , style: TextStyle(color: Colors.white),),
          ),)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xffEEEEEE),
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white ,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    TextButton.icon(onPressed: (){},
                        icon:  Icon(Icons.lock_outline_rounded , color: Colors.grey , size: 30,),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text("Ganti PIN"  , style: TextStyle(color: Colors.black),),
                            Icon(Icons.arrow_forward_ios , color: Colors.grey[350],)
                          ],
                        )),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 20),
                    TextButton.icon(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Passkey(),));
                    },
                        icon:Icon(Icons.vpn_key_outlined ,color: Colors.grey, size: 30,),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Passkey" ,  style: TextStyle(color: Colors.black)),
                            Row(
                              children: [
                                Text("Pasang" ,  style: TextStyle(color: Colors.grey)),
                                Icon(Icons.arrow_forward_ios, color: Colors.grey[350],)
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 20),
                    TextButton.icon(onPressed: (){},
                        icon:Icon(Icons.settings ,color: Colors.grey, size: 30 ),
                        label:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pertanyaan Keamanan" ,  style: TextStyle(color: Colors.black)),
                            Row(
                              children: [
                                Text("Pasang",  style: TextStyle(color: Colors.grey)),
                                Icon(Icons.arrow_forward_ios,color: Colors.grey[350],)
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 20),
                    TextButton.icon(onPressed: (){},
                        icon:Icon(Icons.settings_overscan , color: Colors.grey,) ,
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("MoPay Viz", style: TextStyle(color: Colors.black)),
                            Row(
                              children: [
                                Text("Pasang", style: TextStyle(color: Colors.grey)),
                                Icon(Icons.arrow_forward_ios , color: Colors.grey[350],)
                              ],
                            )
                          ],
                        )
                        ),
                    SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 20),
                    TextButton.icon(onPressed: (){},
                        icon: Icon(Icons.location_on_sharp , color: Colors.grey,size: 30,),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Location Permission" , style: TextStyle(color: Colors.black)),
                            Switch(
                                value: On_off, 
                                onChanged: (value){
                                  setState(() {
                                    On_off = value;
                                  });
                                },
                            activeTrackColor: Color(0xff850000),
                            activeColor: Colors.white,
                            )
                                
                              ],
                            )
                          ,
                        )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// PASSKEY BAGIAN DARI FITUR SECURITY SETTING -------------------------------------------------------------------------------------------------------------------------
class Passkey extends StatefulWidget {
  const Passkey({super.key});

  @override
  State<Passkey> createState() => _PasskeyState();
}

class _PasskeyState extends State<Passkey> {
  bool check = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text("Aktifkan Passkey" , style: TextStyle(color: Colors.white),),
        ),
        flexibleSpace:
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: ([ Color(0xffFEA1A1),Color(0xff850000),])
              )
            ),
          )
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ([ Color(0xffFEA1A1),Color(0xff850000),])
          )
        ),
        // color: Color(0xff850000),
        child: SingleChildScrollView(
          child:
            Column(
              children: [
                SizedBox(height: 80),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage("https://media.istockphoto.com/id/1290393291/vector/safety-and-security-of-personal-data-concept.jpg?s=612x612&w=0&k=20&c=dkgl6-1_ZTSJIotGru1dvldX1c_boORZ6u0zYstTsiE="),
                  ),
                SizedBox(height: 30),
                Text("Masuk Dengan Metode Termudah" , style: TextStyle(color: Colors.white , fontSize: 25),),
                Text("Passkey Bikin Masuk Keakun MoPay lebih" ,style: TextStyle(color: Colors.white , fontSize: 15), ),
                Text("Praktis Dengan Wajah , Sidik Jari ,Ataupun Pola." , style: TextStyle(color: Colors.white , fontSize: 15),),
                Text("Tentang Passkey" ,style: TextStyle(color: Colors.white , fontSize: 15),),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: check,
                        onChanged: (bool? value){
                      setState(() {
                        check = value!;
                      });
                        },activeColor: Colors.blueAccent,
                    side: BorderSide(color: Colors.white),),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text("Dengan Melanjutkan, Kamu Setuju Dengan Syarat &" , style: TextStyle(color: Colors.white , fontSize: 12),),
                        Text("Ketentuan dan Kebijakan Privasi Kami" , style: TextStyle(color: Colors.white , fontSize: 12)),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                OutlinedButton(onPressed: (){},
                    child: Text("Aktifkan Passkey" , style: TextStyle(color: Colors.grey , fontSize: 20 , fontWeight: FontWeight.bold),),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(250, 50),
                  backgroundColor: Colors.white
                ),),
                SizedBox(height: 10),
                TextButton(onPressed: (){},
                    child: Text("Lain Kali Aja" , style: TextStyle(color: Colors.white , fontSize: 20 ,fontWeight: FontWeight.bold),))

          ],
        ) ,
      ),
      ),
    );
  }
}


