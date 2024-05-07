import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/pages/home/home_bucket.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isSecurePassword = true;
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    List userData = Provider.of<MopayUserDataProvider>(context).data;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background/bg2.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo-mopay/logo2.png',
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, -2),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: userController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Create Your UserName";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            prefixIcon: Icon(Icons.person_2),
                            hintText: ('Create Your Username'),
                            label: Text(
                              'Username',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff881736),
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          // onChanged: (value) {
                          //   _formkey.currentState?.validate();
                          // },
                          validator: (value) {
                            List matchedPhoneNumber = userData
                                .where((user) =>
                                    user.noTelp == phoneController.text)
                                .toList();

                            if (value!.isEmpty) {
                              return "Please Enter a Phone Number";
                            } else if (!RegExp(
                                    r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                .hasMatch(value)) {
                              return "Please Enter a Valid Phone Number";
                            } else if (matchedPhoneNumber.isNotEmpty) {
                              return 'Phone number already used';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            prefixIcon: Icon(Icons.phone_android),
                            hintText: ('Insert Your Phone Number'),
                            label: Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff881736),
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            List matchedEmail = userData
                                .where((user) =>
                                    user.email == emailController.text)
                                .toList();

                            if (value!.isEmpty) {
                              return "Please Enter Your Email";
                            } else if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value)) {
                              return "Please Enter a Valid Email";
                            } else if (matchedEmail.isNotEmpty) {
                              return "Email already used";
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              prefixIcon: Icon(Icons.email),
                              hintText: "Insert Your Email",
                              label: Text(
                                'Email',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff881736),
                                    fontSize: 18),
                              )),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isSecurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isSecurePassword = !_isSecurePassword;
                                  });
                                },
                              ),
                              hintText: "Insert Your Password",
                              label: const Text(
                                'Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff881736),
                                    fontSize: 18),
                              )),
                          obscureText: _isSecurePassword,
                        ),
                        const SizedBox(height: 50),

                        // AnimatedButton(
                        //   text: "Register",
                        //   color: Colors.red,
                        //   pressEvent: () {
                        //     if (_formkey.currentState!.validate()) {
                        //       AwesomeDialog(
                        //         context: context,
                        //         dialogType: DialogType.success,
                        //         animType: AnimType.topSlide,
                        //         title: "Success",
                        //         desc: "Registration Successfully",
                        //         btnOkOnPress: () {
                        //           Navigator.pushReplacementNamed(
                        //               context, '/login');
                        //         },
                        //       ).show();
                        //     }
                        //   },
                        // ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeBucket()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            elevation: 5,
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width),
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text("Sign In"),
                        ),
                        const SizedBox(height: 25),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
