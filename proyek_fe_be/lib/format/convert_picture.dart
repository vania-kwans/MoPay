import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<String> convertImageToBase64(String imagePath) async {
  File imageFile = File(imagePath);

  // Cek ukuran file
  int fileSizeInBytes = await imageFile.length();
  double fileSizeInMB = fileSizeInBytes / (1024 * 1024); // ubah ke MB

  if (fileSizeInMB > 3) {
    throw Exception('Gambar tidak boleh melebihi 3 MB');
  }

  List<int> imageBytes = await imageFile.readAsBytes();
  String base64Image = base64Encode(imageBytes);

  return base64Image;
}
