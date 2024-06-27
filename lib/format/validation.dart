bool isProfileNameValid(String name) {
  final RegExp regex = RegExp(r'^[a-zA-Z\s]{1,30}$');
  if (name.trim().isEmpty) {
    return false;
  }
  return name == name.trim() && regex.hasMatch(name);
}

bool isPhoneNumberValid(String phone) {
  final RegExp regex = RegExp(r'^0\d{7,12}$');
  return regex.hasMatch(phone);
}

bool isEmailValid(String email) {
  final RegExp regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  return regex.hasMatch(email);
}
