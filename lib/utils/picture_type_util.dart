import 'package:collection/collection.dart';

enum PictureType { link, base64, none }

class PictureTypeUtil {
  static const Map<String, PictureType> _map = {
    "link": PictureType.link,
    "base64": PictureType.base64,
    "none": PictureType.none
  };

  static PictureType fromString(String? type) {
    return _map[type] ?? PictureType.none;
  }

  static String textOf(PictureType type) {
    return _map.keys.firstWhereOrNull((key) => _map[key] == type) ?? "none";
  }
}
