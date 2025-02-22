import 'package:driver_registration_app/features/bank_details_registration/domain/entities/bank_details.dart';

class BankDetailsModel extends BankDetails {
  BankDetailsModel({
    required super.bankName,
    required super.accountNumber,
    required super.branch,
    required super.accountHolderName,
  });

  Map<String, dynamic> toJson() {
    return {
      'bankName': bankName,
      'accountNumber': accountNumber,
      'branch': branch,
      'accountHolderName': accountHolderName,
    };
  }

  static String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) return "Account Number is required";
    if (value.length < 10) return "Account Number must be at least 10 digits";
    return null;
  }

  static String? validateRequiredField(String? value) {
    if (value == null || value.isEmpty) return "This field is required";
    return null;
  }
}
