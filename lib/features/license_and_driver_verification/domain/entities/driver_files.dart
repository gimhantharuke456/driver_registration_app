class DriverFiles {
  final String licenseFront;
  final String licenseBack;
  final String driverImage;
  final String? additionalDocs;

  DriverFiles({
    required this.licenseFront,
    required this.licenseBack,
    required this.driverImage,
    this.additionalDocs,
  });
}
