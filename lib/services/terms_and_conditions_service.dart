import 'package:flutter/foundation.dart';
import 'package:memories/services/storage_service.dart';

class TermsAndConditionsService extends ChangeNotifier {
  final StorageService _storageService;

  TermsAndConditionsService(this._storageService);

  Future<void> setTermsAndConditions(bool termsAndConditions) async {
    await _storageService.saveBool('termsAccepted', termsAndConditions);
  }

  bool? getTermsAndConditions() {
    return _storageService.getBool('termsAccepted');
  }
}
