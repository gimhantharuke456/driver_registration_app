import 'package:image_picker/image_picker.dart';

abstract class FileRepository {
  Future<String?> uploadFile(XFile file);
}
