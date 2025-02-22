import 'dart:io';

class VehicleDetails {
  final File vehicleBook;
  final File incomeCertificate;
  final File insuranceDocument;
  final File vehicleFront;
  final File vehicleBack;

  VehicleDetails({
    required this.vehicleBook,
    required this.incomeCertificate,
    required this.insuranceDocument,
    required this.vehicleFront,
    required this.vehicleBack,
  });
}
