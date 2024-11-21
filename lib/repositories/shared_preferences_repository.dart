import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_counter/repositories/database_repository.dart';

class SharedPreferencesRepository implements DatabaseRepository {
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  static const prefsKey = "water_counter";

  @override
  Future<void> decrementCounter() async {
    int counter = await prefs.getInt(prefsKey) ?? 0;
    counter--;
    _saveToPrefs(counter);
  }

  @override
  Future<int> getCounter() async {
    return await prefs.getInt(prefsKey) ?? 0;
  }

  @override
  Future<void> incrementCounter() async {
    int counter = await prefs.getInt(prefsKey) ?? 0;
    counter++;
    _saveToPrefs(counter);
  }

  @override
  Future<void> resetCounter() async {
    int counter = await prefs.getInt(prefsKey) ?? 0;
    counter = 0;
    _saveToPrefs(counter);
  }

  void _saveToPrefs(int counter) async {
    await prefs.setInt(prefsKey, counter);
  }
}
