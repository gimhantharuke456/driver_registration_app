import 'package:driver_registration_app/core/constants/strings.dart';
import 'package:driver_registration_app/core/routing/app_routes.dart';
import 'package:driver_registration_app/core/utils/navigation_util.dart';
import 'package:driver_registration_app/presentation/widgets/custom_button.dart';
import 'package:driver_registration_app/presentation/widgets/custom_input_field.dart';
import 'package:driver_registration_app/features/driver_registration/data/models/driver_model.dart';
import 'package:driver_registration_app/features/driver_registration/presentation/provider/driver_provider.dart';
import 'package:driver_registration_app/presentation/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DriverRegistrationScreen extends StatefulWidget {
  const DriverRegistrationScreen({super.key});

  @override
  State<DriverRegistrationScreen> createState() =>
      _DriverRegistrationScreenState();
}

class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nicController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    nicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DriverProvider>(context);
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: GradientBackground(
        padding: 0,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1A1B25), // Dark navy blue
                    Color(0xFF0D0E14), // Almost black
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const FlutterLogo(),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        AppStrings.appName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    AppStrings.driverRegistrationTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    AppStrings.driverRegistrationSubtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomInputField(
                            hintText: AppStrings.nameHint,
                            controller: nameController,
                            validator: DriverModel.validateName,
                          ),
                          const SizedBox(height: 16),
                          CustomInputField(
                            hintText: AppStrings.mobileHint,
                            controller: mobileController,
                            keyboardType: TextInputType.phone,
                            validator: DriverModel.validateMobile,
                          ),
                          const SizedBox(height: 16),
                          CustomInputField(
                            hintText: AppStrings.emailHint,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: DriverModel.validateEmail,
                          ),
                          const SizedBox(height: 16),
                          CustomInputField(
                            hintText: AppStrings.nicHint,
                            controller: nicController,
                            validator: DriverModel.validateNIC,
                          ),
                        ],
                      ),

                      // Button and error message group
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: keyboardHeight > 0 ? keyboardHeight : 0),
                        child: Column(
                          children: [
                            provider.isLoading
                                ? const CircularProgressIndicator()
                                : CustomButton(
                                    text: AppStrings.registerButton,
                                    onPressed: () async {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        final driver = DriverModel(
                                          id: "", // ID will be generated by backend
                                          name: nameController.text.trim(),
                                          mobile: mobileController.text.trim(),
                                          email: emailController.text.trim(),
                                          nic: nicController.text.trim(),
                                        );

                                        await provider.registerDriver(driver);
                                        NavigationUtil.navigateTo(
                                          context: context,
                                          routeName: AppRoutes
                                              .drverAndLicenseRegistration,
                                        );
                                      }
                                    },
                                  ),
                            if (provider.errorMessage != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  provider.errorMessage!,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
