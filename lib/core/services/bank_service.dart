import 'dart:async';
import 'package:driver_registration_app/features/bank_details_registration/data/models/bank_details_model.dart';
import '../network/api_client.dart';

class BankService {
  final ApiClient apiClient;

  BankService({required this.apiClient});

  // This is a mock method demonstrating bank details submission
  Future<String> submitBankDetails(BankDetailsModel bankDetails) async {
    await Future.delayed(const Duration(seconds: 2));
    return "BANK-12345"; // Mock bank details submission response
  }
}
