import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff4A1A1A),
              Color(0xff999999),
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60, left: 22),
            child: Text(
              'Forgot Password',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, top: 10),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: Icon(Icons.email),
                        hintText: ('Insert Your Email'),
                        label: Text(
                          'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff881736),
                              fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: passController,
                      // onChanged: (value) {
                      //   _formkey.currentState?.validate();
                      // },
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
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: passController,
                      // onChanged: (value) {
                      //   _formkey.currentState?.validate();
                      // },
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
                            'Confirm Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff881736),
                                fontSize: 18),
                          )),
                      obscureText: _isSecurePassword,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, '/login');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff4A1A1A),
                        elevation: 5,
                        fixedSize:
                            Size.fromWidth(MediaQuery.of(context).size.width),
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Done"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
