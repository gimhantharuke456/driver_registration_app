import 'package:driver_registration_app/features/driver_registration/domain/entities/driver.dart';

class DriverModel extends Driver {
  const DriverModel({
    required super.id,
    required super.name,
    required super.mobile,
    required super.email,
    required super.nic,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      mobile: json['mobile'] ?? '',
      email: json['email'] ?? '',
      nic: json['nic'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "mobile": mobile,
      "email": email,
      "nic": nic,
    };
  }

  // Validation methods
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    // Assuming mobile number format: +94XXXXXXXXX or 07XXXXXXXX
    final mobileRegExp = RegExp(r'^(?:\+94|0)\d{9}$');
    if (!mobileRegExp.hasMatch(value)) {
      return 'Enter a valid mobile number';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validateNIC(String? value) {
    if (value == null || value.isEmpty) {
      return 'NIC is required';
    }
    return null;
  }
}
