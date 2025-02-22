import 'package:driver_registration_app/core/utils/file_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/usecases/upload_file.dart';

class FileProvider extends ChangeNotifier {
  final UploadFile uploadFile;
  String? licenseFrontUrl;
  String? licenseBackUrl;
  String? driverImageUrl;
  String? additionalDocsUrl;
  XFile? licenseFrontFile;
  XFile? licenseBackFile;
  XFile? driverImageFile;
  XFile? additionalDocsFile;

  FileProvider({required this.uploadFile});

  Future<void> pickAndUploadFile(ImageSource source, String type) async {
    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: source);

    if (file == null) return;

    if (!FileValidator.isValidFile(file)) {
      debugPrint("Invalid file: Size/Format issue");
      return;
    }

    switch (type) {
      case 'licenseFront':
        licenseFrontFile = file;
        break;
      case 'licenseBack':
        licenseBackFile = file;
        break;
      case 'driverImage':
        driverImageFile = file;
        break;
      case 'additionalDocs':
        additionalDocsFile = file;
        break;
    }

    final uploadedUrl = await uploadFile(file);
    if (uploadedUrl != null) {
      switch (type) {
        case 'licenseFront':
          licenseFrontUrl = uploadedUrl;
          break;
        case 'licenseBack':
          licenseBackUrl = uploadedUrl;
          break;
        case 'driverImage':
          driverImageUrl = uploadedUrl;
          break;
        case 'additionalDocs':
          additionalDocsUrl = uploadedUrl;
          break;
      }
      notifyListeners();
    }
  }
}
