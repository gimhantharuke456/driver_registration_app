import 'dart:io';
import 'package:driver_registration_app/core/constants/strings.dart';
import 'package:driver_registration_app/core/routing/app_routes.dart';
import 'package:driver_registration_app/core/utils/navigation_util.dart';
import 'package:driver_registration_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../provider/vehicle_provider.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key});

  @override
  _VehicleDetailsScreenState createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final ImagePicker _picker = ImagePicker();

  File? _vehicleBook;
  File? _incomeCertificate;
  File? _insuranceDocument;
  File? _vehicleFront;
  File? _vehicleBack;

  Future<void> _pickImage(Function(File) onPicked) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        onPicked(File(pickedFile.path));
      });
    }
  }

  void _submit() async {
    if (_vehicleBook == null ||
        _incomeCertificate == null ||
        _insuranceDocument == null ||
        _vehicleFront == null ||
        _vehicleBack == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please upload all required images")),
      );
      return;
    }

    await context.read<VehicleProvider>().submitDetails(
          vehicleBook: _vehicleBook!,
          incomeCertificate: _incomeCertificate!,
          insuranceDocument: _insuranceDocument!,
          vehicleFront: _vehicleFront!,
          vehicleBack: _vehicleBack!,
        );

    NavigationUtil.navigateTo(
        context: context, routeName: AppRoutes.bankDetailsRegistration);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<VehicleProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.vehicleDetailsTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildImagePicker("Vehicle Book Photo", _vehicleBook,
                (file) => _vehicleBook = file),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              children: [
                _buildImagePicker("Income Certificate Photo",
                    _incomeCertificate, (file) => _incomeCertificate = file),
                _buildImagePicker("Insurance Document", _insuranceDocument,
                    (file) => _insuranceDocument = file),
                _buildImagePicker("Vehicle Front Photo", _vehicleFront,
                    (file) => _vehicleFront = file),
                _buildImagePicker("Vehicle Back Photo", _vehicleBack,
                    (file) => _vehicleBack = file),
              ],
            )),
            const SizedBox(height: 20),
            provider.isSubmitting
                ? const CircularProgressIndicator()
                : CustomButton(
                    onPressed: _submit,
                    text: AppStrings.continueButton,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker(String label, File? image, Function(File) onPicked) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _pickImage(onPicked),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: image == null
                ? const Center(child: Text("Tap to upload image"))
                : Image.file(image, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
