import 'package:driver_registration_app/features/bank_details_registration/presentation/screens/bank_details_screen.dart';
import 'package:driver_registration_app/features/driver_registration/presentation/screens/driver_registration_screen.dart';
import 'package:driver_registration_app/features/license_and_driver_verification/presentation/screens/file_upload_screen.dart';
import 'package:driver_registration_app/features/vehicle_details_registration/presentation/screens/vehicle_details_screen.dart';
import 'package:driver_registration_app/presentation/screens/splash_screen.dart';
import 'package:driver_registration_app/presentation/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.driverRegistration:
        return MaterialPageRoute(
            builder: (_) => const DriverRegistrationScreen());
      case AppRoutes.vehicleDetailsRegistration:
        return MaterialPageRoute(builder: (_) => const VehicleDetailsScreen());
      case AppRoutes.success:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());
      case AppRoutes.drverAndLicenseRegistration:
        return MaterialPageRoute(builder: (_) => const FileUploadScreen());
      case AppRoutes.bankDetailsRegistration:
        return MaterialPageRoute(builder: (_) => const BankDetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
