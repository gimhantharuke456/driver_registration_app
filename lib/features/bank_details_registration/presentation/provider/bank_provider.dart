import 'package:flutter/material.dart';
import '../../domain/entities/bank_details.dart';
import '../../domain/usecases/submit_bank_details.dart';

class BankProvider extends ChangeNotifier {
  final SubmitBankDetails submitBankDetails;
  bool isSubmitting = false;
  String? responseMessage;

  BankProvider({required this.submitBankDetails});

  Future<void> submitDetails(BankDetails details) async {
    isSubmitting = true;
    responseMessage = null;
    notifyListeners();

    try {
      responseMessage = await submitBankDetails(details);
    } catch (e) {
      responseMessage = "Submission Failed!";
    }

    isSubmitting = false;
    notifyListeners();
  }
}
