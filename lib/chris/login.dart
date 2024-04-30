import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff4A1A1A),
                  Color(0xff999999),
                ]
              ),
            ),
          child: Padding(
            padding: EdgeInsets.only(top: 60, left: 22),
            child: Text('Our Logo\nSign In', style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold
              ),
            ),
          ),
        
      ),
          Padding(
            padding: EdgeInsets.only(top : 200),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                ),
                color: Colors.white,
              ) ,
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 18, top: 10),
                child: Form(key: _formkey,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,                
                    children: [
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        // onChanged: (value) {
                        //   _formkey.currentState?.validate();
                        // },
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Please Enter a Phone Number";
                          } else if(!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)){
                            return "Please Enter a Valid Phone Number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                          ),
                          prefixIcon: Icon(Icons.phone_android),
                          hintText: ('Insert Your Phone Number'),
                          label: Text('Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff881736),
                            fontSize: 18
                          ),),
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        controller: passController,
                        // onChanged: (value) {
                        //   _formkey.currentState?.validate();
                        // },
                        validator: (value) {
                          if (value!.isEmpty){
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isSecurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isSecurePassword = !_isSecurePassword;
                              });
                            },
                          ),
                          hintText: "Insert Your Password",
                          label: Text('Password', 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff881736),
                            fontSize: 18
                          ),)
                        ),
                        obscureText: _isSecurePassword,
                        
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: () {
                          Navigator.pushReplacementNamed(context, '/forgotpass');
                        }, child: Text("Forget Password?",
                        style: TextStyle(
                          color: Colors.black
                        ),),
                        )
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Text('Forgot Password? ',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.black,
                      //     fontSize: 15
                      //   ),
                      //   ),
                      // ),
                    SizedBox(height: 70,),
                    ElevatedButton(onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/register');
                      }
                    }, 
                    child: Text ("Sign In"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff4A1A1A),
                      elevation: 5,
                      fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    )
                    )

                    ],
                                ),
                              
                ),
              ),
          ),
          ),
        ],
      )

    );
  }
}