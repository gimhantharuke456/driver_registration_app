import 'package:driver_registration_app/features/driver_registration/data/models/driver_model.dart';

import '../entities/driver.dart';

abstract class DriverRepository {
  Future<Driver> registerDriver(DriverModel driver);
}
