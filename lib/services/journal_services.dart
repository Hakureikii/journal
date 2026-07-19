import 'package:hive/hive.dart';

class JournalServices {
  static const String _boxName = 'journalBox';

  Future<void> addEntry(Map<String, dynamic> entry) async {
    final box = await Hive.openBox(_boxName);
    await box.add(entry);
    await box.close();
  }

  Future<List<Map<String, dynamic>>> getEntries() async {
    final box = await Hive.openBox(_boxName);
    final entries = box.values.cast<Map<String, dynamic>>().toList();
    await box.close();
    return entries;
  }

  Future<void> deleteEntry(int index) async {
    final box = await Hive.openBox(_boxName);
    await box.deleteAt(index);
    await box.close();
  }
}
