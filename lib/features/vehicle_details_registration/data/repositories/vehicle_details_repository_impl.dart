import '../../domain/entities/vehicle_details.dart';
import '../../domain/repositories/vehicle_repository.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  @override
  Future<String> submitVehicleDetails(VehicleDetails details) async {
    await Future.delayed(const Duration(seconds: 2));
    return "VEHICLE-12345"; // Mock response
  }
}
