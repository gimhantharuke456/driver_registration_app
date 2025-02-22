import 'package:driver_registration_app/features/bank_details_registration/domain/entities/bank_details.dart';
import 'package:driver_registration_app/features/bank_details_registration/domain/repositories/bank_repository.dart';

class BankRepositoryImpl implements BankRepository {
  @override
  Future<String> submitBankDetails(BankDetails details) async {
    await Future.delayed(const Duration(seconds: 2));
    String bankId = "1231231"; // Simulated Delay
    return "BANK-$bankId"; // Mock response
  }
}
