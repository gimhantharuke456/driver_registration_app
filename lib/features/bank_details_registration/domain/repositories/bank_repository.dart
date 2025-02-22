import '../entities/bank_details.dart';

abstract class BankRepository {
  Future<String> submitBankDetails(BankDetails details);
}
