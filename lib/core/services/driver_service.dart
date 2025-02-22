import 'dart:async';
import 'package:driver_registration_app/features/driver_registration/data/models/driver_model.dart';

import '../network/api_client.dart';

class DriverService {
  final ApiClient apiClient;

  DriverService({required this.apiClient});
  // this is a mock method demostrate driver register
  Future<DriverModel> registerDriver(DriverModel driver) async {
    await Future.delayed(const Duration(seconds: 2));
    return DriverModel(
      id: "12345",
      name: driver.name,
      email: driver.email,
      nic: driver.nic,
      mobile: driver.mobile,
    );
  }
}
