import 'package:image_picker/image_picker.dart';
import '../../domain/repositories/file_repository.dart';

class FileRepositoryImpl implements FileRepository {
  @override
  Future<String?> uploadFile(XFile file) async {
    try {
      await Future.delayed(
          const Duration(seconds: 2)); // Simulated Upload Delay
      return "https://example.com/uploads/${file.name}"; // Mock URL
    } catch (e) {
      return null;
    }
  }
}
