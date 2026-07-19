import 'package:hive/hive.dart';

void main() async {
  Hive.init('hive_data');

  final box = await Hive.openBox('testBox');

  await box.put('greeting', 'Hello from Hive');

  final value = box.get('greeting');

  print(value);

  await Hive.close();
}
