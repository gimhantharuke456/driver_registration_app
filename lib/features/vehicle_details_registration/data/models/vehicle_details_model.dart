import 'dart:io';
import '../../domain/entities/vehicle_details.dart';

class VehicleDetailsModel extends VehicleDetails {
  VehicleDetailsModel({
    required super.vehicleBook,
    required super.incomeCertificate,
    required super.insuranceDocument,
    required super.vehicleFront,
    required super.vehicleBack,
  });

  Map<String, dynamic> toJson() {
    return {
      'vehicleBook': vehicleBook.path,
      'incomeCertificate': incomeCertificate.path,
      'insuranceDocument': insuranceDocument.path,
      'vehicleFront': vehicleFront.path,
      'vehicleBack': vehicleBack.path,
    };
  }

  static String? validateImage(File? file) {
    if (file == null) return "This field is required";
    return null;
  }
}
