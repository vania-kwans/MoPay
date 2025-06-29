import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/format/validation.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:provider/provider.dart';

class ChangeProfilePhoneNumber extends StatefulWidget {
  const ChangeProfilePhoneNumber({super.key});

  @override
  State<ChangeProfilePhoneNumber> createState() =>
      _ChangeProfilePhoneNumberState();
}

class _ChangeProfilePhoneNumberState extends State<ChangeProfilePhoneNumber> {
  final TextEditingController _profilePhoneNumber = TextEditingController();
  bool _isButtonEnabled = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _profilePhoneNumber.addListener(_validatePhone);
  }

  @override
  void dispose() {
    _profilePhoneNumber.removeListener(_validatePhone);
    _profilePhoneNumber.dispose();
    super.dispose();
  }

  void _validatePhone() {
    String phone = _profilePhoneNumber.text;
    bool isValid = isPhoneNumberValid(phone);
    setState(() {
      _isButtonEnabled = isValid;
      if (_profilePhoneNumber.text != "") {
        _errorText =
            isValid ? null : 'Mohon masukkan nomor telepon yang sesuai';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = Provider.of<CurrentUserProvider>(context).currentUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ubah Nomor Handphone',
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
                      'Nomor Handphone saat ini',
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      currentUser.phoneNumber,
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
                controller: _profilePhoneNumber,
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
                    'Nomor Handphone baru',
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
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    color: Colors.black,
                    onPressed: () {
                      _profilePhoneNumber.clear();
                      setState(() {
                        _isButtonEnabled = false;
                      });
                    },
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                              content: const Text('Nomor HP berhasil diubah'),
                              backgroundColor: Colors.red[700],
                              behavior: SnackBarBehavior
                                  .floating, // Floating behavior
                              elevation: 10, // Elevation to make i
                            ),
                          );
                          setState(() {
                            Provider.of<MopayUserDataProvider>(context,
                                    listen: false)
                                .changePhoneNumber(_profilePhoneNumber.text);
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
