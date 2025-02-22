import 'dart:io';
import 'package:flutter/material.dart';
import '../../domain/entities/vehicle_details.dart';
import '../../domain/usecases/submit_vehicle_details.dart';

class VehicleProvider extends ChangeNotifier {
  final SubmitVehicleDetails submitVehicleDetails;
  bool isSubmitting = false;
  String? responseMessage;

  VehicleProvider({required this.submitVehicleDetails});

  Future<void> submitDetails({
    required File vehicleBook,
    required File incomeCertificate,
    required File insuranceDocument,
    required File vehicleFront,
    required File vehicleBack,
  }) async {
    isSubmitting = true;
    responseMessage = null;
    notifyListeners();

    final details = VehicleDetails(
      vehicleBook: vehicleBook,
      incomeCertificate: incomeCertificate,
      insuranceDocument: insuranceDocument,
      vehicleFront: vehicleFront,
      vehicleBack: vehicleBack,
    );

    try {
      responseMessage = await submitVehicleDetails(details);
    } catch (e) {
      responseMessage = "Submission Failed!";
    }

    isSubmitting = false;
    notifyListeners();
  }
}
