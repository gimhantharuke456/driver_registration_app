import '../entities/vehicle_details.dart';

abstract class VehicleRepository {
  Future<String> submitVehicleDetails(VehicleDetails details);
}
