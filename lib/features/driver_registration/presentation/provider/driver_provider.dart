import 'package:driver_registration_app/features/driver_registration/data/models/driver_model.dart';
import 'package:driver_registration_app/features/driver_registration/domain/usecases/register_driver.dart';
import 'package:flutter/material.dart';

class DriverProvider with ChangeNotifier {
  final RegisterDriver registerDriverUseCase;
  bool isLoading = false;
  String? errorMessage;

  DriverProvider({required this.registerDriverUseCase});

  Future<void> registerDriver(DriverModel driver) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await registerDriverUseCase(driver);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
