import '../../domain/entities/driver_files.dart';

class DriverFilesModel extends DriverFiles {
  DriverFilesModel({
    required super.licenseFront,
    required super.licenseBack,
    required super.driverImage,
    super.additionalDocs,
  });

  Map<String, dynamic> toJson() {
    return {
      'licenseFront': licenseFront,
      'licenseBack': licenseBack,
      'driverImage': driverImage,
      'additionalDocs': additionalDocs,
    };
  }
}
