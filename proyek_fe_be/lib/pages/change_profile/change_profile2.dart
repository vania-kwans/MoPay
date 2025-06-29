import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mopay_ewallet/bloc/user/user_bloc.dart';
import 'package:mopay_ewallet/data/data_user_mopay.dart';
import 'package:mopay_ewallet/format/convert_picture.dart';
import 'package:mopay_ewallet/pages/change_profile/change_email.dart';
import 'package:mopay_ewallet/pages/change_profile/change_name.dart';
import 'package:mopay_ewallet/pages/change_profile/change_phone_number.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:mopay_ewallet/utils/picture_type_util.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfile2 extends StatefulWidget {
  const ChangeProfile2({super.key});

  @override
  State<ChangeProfile2> createState() => _ChangeProfile2State();
}

class _ChangeProfile2State extends State<ChangeProfile2> {
  String? _selectedImage;
  late UserBloc bloc;

  @override
  void initState() {
    bloc = Provider.of<UserBloc>(context, listen: false);
    super.initState();
  }

  Future getImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      Uint8List imageBytes = await image.readAsBytes();

      int fileSizeInBytes = imageBytes.length;
      double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

      if (fileSizeInMB > 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gambar tidak boleh melebihi 3 MB'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      try {
        String base64Image = base64Encode(imageBytes);
        setState(() {
          _selectedImage = base64Image;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to convert image to base64: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future getImageFromCamera() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      Uint8List imageBytes = await image.readAsBytes();

      int fileSizeInBytes = imageBytes.length;
      double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

      if (fileSizeInMB > 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gambar tidak boleh melebihi 3 MB'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      try {
        String base64Image = base64Encode(imageBytes);
        setState(() {
          _selectedImage = base64Image;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to convert image to base64: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = Provider.of<CurrentUserProvider>(context).currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        // iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey[200],
              backgroundImage: _selectedImage == ""
                  ? MemoryImage(base64Decode(_selectedImage!))
                  : currentUser.pictureLink.isNotEmpty
                      ? NetworkImage(currentUser.pictureLink) as ImageProvider
                      : null,
              child: _selectedImage == null && currentUser.pictureLink.isEmpty
                  ? const Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.black,
                    )
                  : null,
            ),
          ),
          GestureDetector(
            onTap: () {
              currentUser.pictureLink.isEmpty
                  ? _showModelBottomWithoutDeleteButton(context)
                  : _showModalBottomWithDeleteButton(context);
            },
            child: const Text(
              'Ubah Foto',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(214, 0, 92, 196),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Divider(
            color: Colors.grey[200],
            height: 1,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            title: const Text(
              'Nama',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            subtitle: Text(
              currentUser.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChangeProfileName(),
                ));
              },
              child: const Text(
                'Ubah',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(214, 0, 92, 196),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[200],
            indent: 15,
            endIndent: 15,
            height: 1,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            title: const Text(
              'Nomor HP',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            subtitle: Text(
              currentUser.phoneNumber,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChangeProfilePhoneNumber(),
                ));
              },
              child: const Text(
                'Ubah',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(214, 0, 92, 196),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[200],
            indent: 15,
            endIndent: 15,
            height: 1,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            title: const Text(
              'Email',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            subtitle: Text(
              currentUser.email,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            trailing: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChangeProfileEmail(),
                ));
              },
              child: const Text(
                'Ubah',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(214, 0, 92, 196),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[200],
            indent: 15,
            endIndent: 15,
            height: 1,
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showModelBottomWithoutDeleteButton(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Wrap(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  getImageFromCamera();

                  if (_selectedImage != null) {
                    bloc.updateProfilePicture(
                        _selectedImage!, PictureType.base64);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Foto profil berhasil diubah'),
                      backgroundColor: Colors.red[700],
                      behavior: SnackBarBehavior.floating, // Floating behavior
                      elevation: 10, // Elevation to make i
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: const Text(
                    'Ambil foto',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[200],
                height: 1,
              ),
              GestureDetector(
                onTap: () {
                  getImageFromGallery();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Foto profil berhasil diubah'),
                      backgroundColor: Colors.red[700],
                      behavior: SnackBarBehavior.floating, // Floating behavior
                      elevation: 10, // Elevation to make i
                    ),
                  );
                  Navigator.of(context).pop();
                  // setState(() {
                  //   Provider.of<MopayUserDataProvider>(context, listen: false)
                  //       .ChangeProfilePicture(_selectedImage);
                  // });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: const Text(
                    'Pilih dari galeri',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(5),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: const Text(
                    'Batalkan',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _showModalBottomWithDeleteButton(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Wrap(
            children: [
              GestureDetector(
                onTap: () {
                  getImageFromCamera();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Foto profil berhasil diubah'),
                      backgroundColor: Colors.red[700],
                      behavior: SnackBarBehavior.floating, // Floating behavior
                      elevation: 10, // Elevation to make i
                    ),
                  );
                  Navigator.of(context).pop();
                  // setState(() {
                  //   Provider.of<MopayUserDataProvider>(context, listen: false)
                  //       .ChangeProfilePicture(_selectedImage);
                  // });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: const Text(
                    'Ambil foto',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[200],
                height: 1,
              ),
              GestureDetector(
                onTap: () {
                  getImageFromGallery();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Foto profil berhasil diubah'),
                      backgroundColor: Colors.red[700],
                      behavior: SnackBarBehavior.floating, // Floating behavior
                      elevation: 10, // Elevation to make i
                    ),
                  );
                  Navigator.of(context).pop();
                  // setState(() {
                  //   Provider.of<MopayUserDataProvider>(context, listen: false)
                  //       .ChangeProfilePicture(_selectedImage);
                  // });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: const Text(
                    'Pilih dari galeri',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[200],
                height: 1,
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Foto profil berhasil dihapus'),
                      backgroundColor: Colors.red[700],
                      behavior: SnackBarBehavior.floating, // Floating behavior
                      elevation: 10, // Elevation to make i
                    ),
                  );
                  Navigator.of(context).pop();
                  setState(() {
                    Provider.of<MopayUserDataProvider>(context, listen: false)
                        .deleteProfilePicture();
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: const Text(
                    'Hapus foto',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(5),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: const Text(
                    'Batalkan',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
