import 'package:flutter/foundation.dart';
import 'package:memories/services/storage_service.dart';

class LevelService extends ChangeNotifier {
  final StorageService _storageService;

  LevelService(this._storageService);

  Future<void> setLevel(int level) async {
    await _storageService.saveInt('currentLevel', level);
  }

  int? getLevel() {
    return _storageService.getInt('currentLevel');
  }
}
