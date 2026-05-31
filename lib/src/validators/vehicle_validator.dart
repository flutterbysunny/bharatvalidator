import '../../bharatvalidator.dart';

class VehicleValidator {
  final BharatMessages msg;
  const VehicleValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.vehicleRequired;
    final clean = value.trim().replaceAll(RegExp(r'[\s\-]'), '').toUpperCase();
    if (!RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z]{1,3}[0-9]{4}$').hasMatch(clean)) return msg.vehicleInvalid;
    return null;
  }
}