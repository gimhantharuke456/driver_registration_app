import 'package:driver_registration_app/features/driver_registration/data/models/driver_model.dart';

import '../entities/driver.dart';
import '../repositories/driver_repository.dart';

class RegisterDriver {
  final DriverRepository repository;

  RegisterDriver({required this.repository});

  Future<Driver> call(DriverModel driver) async {
    return await repository.registerDriver(driver);
  }
}
