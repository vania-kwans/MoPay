import 'package:flutter/material.dart';
import 'package:mopay_ewallet/bloc/auth/auth_bloc.dart';
import 'package:mopay_ewallet/bloc/store.dart';
import 'package:mopay_ewallet/components/loading_component.dart';
import 'package:mopay_ewallet/pages/pin_code/update_pin/insert_new_pin.dart';
import 'package:mopay_ewallet/utils/app_error.dart';
import 'package:provider/provider.dart';

class ForgotPin extends StatefulWidget {
  const ForgotPin({super.key});

  @override
  State<ForgotPin> createState() => _ForgotPinState();
}

class _ForgotPinState extends State<ForgotPin> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AuthBloc bloc;

  @override
  void initState() {
    bloc = Provider.of<AuthBloc>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: bloc.controller,
            builder: (context, snapshot) {
              return Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/background/bg1.jpeg",
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      color: Colors.white,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            "Lupa Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.2),
                            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30))),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Your Email";
                                      } else if (!RegExp(
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                          .hasMatch(value)) {
                                        return "Please Enter a Valid Email";
                                      }
                                      return null;
                                    },
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
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
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: _phoneController,
                                    keyboardType: TextInputType.phone,
                                    // onChanged: (value) {
                                    //   _formkey.currentState?.validate();
                                    // },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter a Phone Number";
                                      } else if (!RegExp(
                                              r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                          .hasMatch(value)) {
                                        return "Please Enter a Valid Phone Number";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      prefixIcon: Icon(Icons.phone_android),
                                      prefixText: "+62 ",
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
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        String phoneNumber =
                                            "0${_phoneController.text}";
                                        String email = _emailController.text;

                                        showLoadingDialog();
                                        AppError? error =
                                            await bloc.forgotPinVerify(
                                                email, phoneNumber);

                                        if (!context.mounted) return;
                                        Navigator.pop(context);
                                        if (error != null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(error.message),
                                            backgroundColor: Colors.red,
                                          ));
                                          return;
                                        }

                                        if (await Store.getToken() != null) {
                                          if (!context.mounted) return;
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const InsertNewPinPage(),
                                            ),
                                          );
                                        }
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
                                    child: const Text(
                                        "Verifikasi Kepemilikan Akun"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
