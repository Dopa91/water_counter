import 'package:water_counter/models/drink.dart';

abstract class DatabaseRepository {
  Future<int> getCounter();

  Future<void> incrementCounter();

  Future<void> decrementCounter();

  Future<void> resetCounter();
}
