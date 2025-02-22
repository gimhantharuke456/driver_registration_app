import 'dart:io';
import 'package:driver_registration_app/features/license_and_driver_verification/presentation/provider/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FilePickerWidget extends StatelessWidget {
  final String label;
  final String type;

  const FilePickerWidget({super.key, required this.label, required this.type});

  XFile? _getFile(FileProvider provider) {
    switch (type) {
      case 'licenseFront':
        return provider.licenseFrontFile;
      case 'licenseBack':
        return provider.licenseBackFile;
      case 'driverImage':
        return provider.driverImageFile;
      case 'additionalDocs':
        return provider.additionalDocsFile;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FileProvider>(
      builder: (context, fileProvider, child) {
        final file = _getFile(fileProvider);

        return Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () {
              context
                  .read<FileProvider>()
                  .pickAndUploadFile(ImageSource.gallery, type);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(file.path),
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      : const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 48,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Tap to upload',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
