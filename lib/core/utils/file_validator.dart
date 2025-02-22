import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FileValidator {
  static const int maxFileSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedExtensions = ['jpg', 'jpeg', 'png'];

  static bool isValidFile(XFile file) {
    final fileSize = File(file.path).lengthSync();
    final fileExtension = file.path.split('.').last.toLowerCase();

    if (fileSize > maxFileSize) return false;
    if (!allowedExtensions.contains(fileExtension)) return false;

    return true;
  }
}
