import 'package:driver_registration_app/core/constants/strings.dart';
import 'package:driver_registration_app/core/routing/app_routes.dart';
import 'package:driver_registration_app/core/utils/navigation_util.dart';
import 'package:driver_registration_app/presentation/widgets/custom_button.dart';
import 'package:driver_registration_app/presentation/widgets/file_picker_widget.dart';
import 'package:flutter/material.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({super.key});

  @override
  State<FileUploadScreen> createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  String? drivingLicenseFront;
  String? drivingLicensBack;
  String? driverImage;
  String? additionalDocs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.fileUploadTitle)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ListView(
              children: const [
                FilePickerWidget(
                    label: AppStrings.drivingLicenseFrontLabel,
                    type: "licenseFront"),
                FilePickerWidget(
                    label: AppStrings.drivingLicenseBackLabel,
                    type: "licenseBack"),
                FilePickerWidget(
                    label: AppStrings.driverImageLabel, type: "driverImage"),
                FilePickerWidget(
                    label: AppStrings.additionalDocsLabel,
                    type: "additionalDocs"),
              ],
            )),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              text: AppStrings.continueButton,
              onPressed: () {
                NavigationUtil.navigateTo(
                    context: context,
                    routeName: AppRoutes.bankDetailsRegistration);
              },
            )
          ],
        ),
      ),
    );
  }
}
