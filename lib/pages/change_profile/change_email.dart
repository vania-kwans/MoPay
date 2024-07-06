import 'package:flutter/material.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/format/validation.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:provider/provider.dart';

class ChangeProfileEmail extends StatefulWidget {
  const ChangeProfileEmail({super.key});

  @override
  State<ChangeProfileEmail> createState() => _ChangeProfileEmailState();
}

class _ChangeProfileEmailState extends State<ChangeProfileEmail> {
  final TextEditingController _profileEmail = TextEditingController();
  bool _isButtonEnabled = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _profileEmail.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _profileEmail.removeListener(_validateEmail);
    _profileEmail.dispose();
    super.dispose();
  }

  void _validateEmail() {
    String email = _profileEmail.text;
    bool isValid = isEmailValid(email);
    setState(() {
      _isButtonEnabled = isValid;
      if (_profileEmail.text != "") {
        _errorText = isValid ? null : 'Mohon masukkan email yang sesuai';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = Provider.of<CurrentUserProvider>(context).currentUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ubah Email',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email saat ini',
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      currentUser.email,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _profileEmail,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      _isButtonEnabled = true;
                    } else {
                      _isButtonEnabled = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  label: const Text(
                    'Email baru',
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  errorText: _errorText,
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    color: Colors.black,
                    onPressed: () {
                      _profileEmail.clear();
                      setState(() {
                        _isButtonEnabled = false;
                        _errorText = null;
                      });
                    },
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 8,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Email berhasil diubah'),
                              backgroundColor: Colors.red[700],
                              behavior: SnackBarBehavior
                                  .floating, // Floating behavior
                              elevation: 10, // Elevation to make i
                            ),
                          );
                          setState(() {
                            Provider.of<MopayUserDataProvider>(context,
                                    listen: false)
                                .changeEmail(_profileEmail.text);
                          });

                          Navigator.pop(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'UBAH',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
