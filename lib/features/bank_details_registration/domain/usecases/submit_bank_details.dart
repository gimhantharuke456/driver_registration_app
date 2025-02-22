import '../entities/bank_details.dart';
import '../repositories/bank_repository.dart';

class SubmitBankDetails {
  final BankRepository repository;

  SubmitBankDetails(this.repository);

  Future<String> call(BankDetails details) async {
    return await repository.submitBankDetails(details);
  }
}
