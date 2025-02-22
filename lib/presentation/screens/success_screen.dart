import 'package:driver_registration_app/core/constants/strings.dart';
import 'package:driver_registration_app/presentation/widgets/custom_button.dart';
import 'package:driver_registration_app/presentation/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        padding: 16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.done_all_rounded,
                  color: Colors.green[600],
                  size: 64,
                ),
                const Text(AppStrings.successTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
            const Spacer(),
            CustomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: AppStrings.successButton,
            ),
          ],
        ),
      ),
    );
  }
}
