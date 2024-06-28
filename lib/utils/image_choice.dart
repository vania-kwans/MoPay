import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:mopay_ewallet/utils/picture_type_util.dart';

class ImageChoice {
  static ImageProvider<Object> getPicture(Object object) {
    if (object is User) {
      return getUserPicture(object);
    }
    return const AssetImage("assets/images/profile-pic/placeholder.png");
  }

  static ImageProvider<Object> getUserPicture(User user) {
    switch (user.pictureType) {
      case PictureType.base64:
        return MemoryImage(base64Decode(user.pictureLink));
      case PictureType.link:
        return NetworkImage(user.pictureLink);
      default:
        return const AssetImage("assets/images/profile-pic/placeholder.png");
    }
  }
}
