import 'dart:io';

checkLogin({
  required String email,
  required String password,
}) async {
  final userPath = 'user.txt';
  final File userFile = File(userPath);
  final content = await userFile.readAsLines();
  if (email.trim() != content[0] || password.trim() != content[1]) {
    throw FormatException("Email or password is not correct");
  }
}
