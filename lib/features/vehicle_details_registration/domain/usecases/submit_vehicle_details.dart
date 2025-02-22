import '../entities/vehicle_details.dart';
import '../repositories/vehicle_repository.dart';

class SubmitVehicleDetails {
  final VehicleRepository repository;

  SubmitVehicleDetails({required this.repository});

  Future<String> call(VehicleDetails details) async {
    return await repository.submitVehicleDetails(details);
  }
}
