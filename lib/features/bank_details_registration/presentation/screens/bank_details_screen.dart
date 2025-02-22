import 'package:driver_registration_app/core/constants/strings.dart';
import 'package:driver_registration_app/core/routing/app_routes.dart';
import 'package:driver_registration_app/core/utils/navigation_util.dart';
import 'package:driver_registration_app/presentation/widgets/bank_dropdown.dart';
import 'package:driver_registration_app/presentation/widgets/bank_input_field.dart';
import 'package:driver_registration_app/features/bank_details_registration/data/models/bank_details_model.dart';
import 'package:driver_registration_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/bank_details.dart';
import '../provider/bank_provider.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  _BankDetailsScreenState createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _accountNumberController = TextEditingController();
  final _branchController = TextEditingController();
  final _holderNameController = TextEditingController();
  String? _selectedBank;

  @override
  void dispose() {
    _accountNumberController.dispose();
    _branchController.dispose();
    _holderNameController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final bankDetails = BankDetails(
      bankName: _selectedBank!,
      accountNumber: _accountNumberController.text,
      branch: _branchController.text,
      accountHolderName: _holderNameController.text,
    );

    await context.read<BankProvider>().submitDetails(bankDetails);
    NavigationUtil.navigateTo(context: context, routeName: AppRoutes.success);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BankProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.bankDetailsTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              BankDropdown(
                  value: _selectedBank,
                  onChanged: (val) => setState(() => _selectedBank = val)),
              const SizedBox(
                height: 16,
              ),
              BankInputField(
                  label: AppStrings.accountHolderNameLabel,
                  controller: _accountNumberController,
                  validator: BankDetailsModel.validateAccountNumber,
                  inputType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              BankInputField(
                  label: AppStrings.branchLabel,
                  controller: _branchController,
                  validator: BankDetailsModel.validateRequiredField),
              const SizedBox(
                height: 16,
              ),
              BankInputField(
                  label: AppStrings.accountHolderNameLabel,
                  controller: _holderNameController,
                  validator: BankDetailsModel.validateRequiredField),
              const SizedBox(height: 20),
              const Spacer(),
              provider.isSubmitting
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      onPressed: _submit,
                      text: AppStrings.continueButton,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
