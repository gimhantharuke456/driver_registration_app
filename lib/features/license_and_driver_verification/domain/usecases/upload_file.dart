import 'package:image_picker/image_picker.dart';
import '../repositories/file_repository.dart';

class UploadFile {
  final FileRepository repository;

  UploadFile(this.repository);

  Future<String?> call(XFile file) async {
    return await repository.uploadFile(file);
  }
}
