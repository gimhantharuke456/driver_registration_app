import 'package:driver_registration_app/core/constants/urls.dart';
import 'package:driver_registration_app/core/network/api_client.dart';
import 'package:driver_registration_app/core/routing/app_routes.dart';
import 'package:driver_registration_app/core/routing/route_generator.dart';
import 'package:driver_registration_app/core/services/driver_service.dart';
import 'package:driver_registration_app/features/bank_details_registration/data/repositories/bank_repository_impl.dart';
import 'package:driver_registration_app/features/bank_details_registration/domain/usecases/submit_bank_details.dart';
import 'package:driver_registration_app/features/bank_details_registration/presentation/provider/bank_provider.dart';
import 'package:driver_registration_app/features/driver_registration/data/repositories/driver_repository_impl.dart';
import 'package:driver_registration_app/features/driver_registration/domain/usecases/register_driver.dart';
import 'package:driver_registration_app/features/driver_registration/presentation/provider/driver_provider.dart';
import 'package:driver_registration_app/features/license_and_driver_verification/data/repositories/file_repository_impl.dart';
import 'package:driver_registration_app/features/license_and_driver_verification/domain/usecases/upload_file.dart';
import 'package:driver_registration_app/features/license_and_driver_verification/presentation/provider/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';

final apiClient = ApiClient(baseUrl: BASE_URL);
final driverService = DriverService(apiClient: apiClient);
final repository = DriverRepositoryImpl(driverService: driverService);
final registerDriverUseCase = RegisterDriver(repository: repository);
final fileRepositary = FileRepositoryImpl();
final uploadFile = UploadFile(fileRepositary);
final bankDetailsRepository = BankRepositoryImpl();
final bankDetailsUseCase = SubmitBankDetails(bankDetailsRepository);
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) =>
          DriverProvider(registerDriverUseCase: registerDriverUseCase),
    ),
    ChangeNotifierProvider(
      create: (_) => FileProvider(uploadFile: uploadFile),
    ),
    ChangeNotifierProvider(
      create: (_) => BankProvider(submitBankDetails: bankDetailsUseCase),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver Registration App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
