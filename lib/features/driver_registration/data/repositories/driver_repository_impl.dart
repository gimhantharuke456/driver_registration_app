import 'package:driver_registration_app/core/services/driver_service.dart';
import 'package:driver_registration_app/features/driver_registration/data/models/driver_model.dart';
import 'package:driver_registration_app/features/driver_registration/domain/entities/driver.dart';
import 'package:driver_registration_app/features/driver_registration/domain/repositories/driver_repository.dart';

class DriverRepositoryImpl implements DriverRepository {
  final DriverService driverService;

  DriverRepositoryImpl({required this.driverService});

  @override
  Future<Driver> registerDriver(DriverModel driver) async {
    return await driverService.registerDriver(driver);
  }
}
