import 'package:flutter/material.dart';
import 'package:mopay_ewallet/bloc/user/user_bloc.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/format/validation.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:provider/provider.dart';

class ChangeProfileName extends StatefulWidget {
  const ChangeProfileName({super.key});

  @override
  State<ChangeProfileName> createState() => _ChangeProfileNameState();
}

class _ChangeProfileNameState extends State<ChangeProfileName> {
  final TextEditingController _profileName = TextEditingController();
  bool _isButtonEnabled = false;
  String? _errorText;
  late UserBloc bloc;

  @override
  void initState() {
    bloc = Provider.of<UserBloc>(context, listen: false);
    super.initState();
    _profileName.addListener(_validateProfileName);
  }

  @override
  void dispose() {
    _profileName.removeListener(_validateProfileName);
    _profileName.dispose();
    super.dispose();
  }

  void _validateProfileName() {
    String name = _profileName.text;
    bool isValid = isProfileNameValid(name);
    setState(() {
      _isButtonEnabled = isValid;
      if (_profileName.text != "") {
        _errorText = isValid ? null : 'Nama hanya boleh berisi huruf dan spasi';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = Provider.of<CurrentUserProvider>(context).currentUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ubah Nama Profil',
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
                      'Nama Profil saat ini',
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      currentUser.name,
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
                controller: _profileName,
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
                    'Nama Profil Baru',
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
                    onPressed: () {
                      _profileName.clear();
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
                keyboardType: TextInputType.text,
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
                          setState(() {
                            bloc.updateUserName(_profileName.text);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Nama profil berhasil diubah'),
                              backgroundColor: Colors.red[700],
                              behavior: SnackBarBehavior
                                  .floating, // Floating behavior
                              elevation: 10, // Elevation to make i
                            ),
                          );
                          //  setState(() {
                          //     Provider.of<MopayUserDataProvider>(context,
                          //             listen: false)
                          //         .changeName(_profileName.text);
                          //   });

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
