import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_counter/w_c_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final rememberedCounter = await prefs.getInt("counter") ?? 0;
    setState(() {
      _counter = rememberedCounter;
    });
  }

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await prefs.setInt("counter", _counter);
  }

  // TODO: This should be implemented. DONE
  // ignore: unused_element
  void _decrementCounter() async {
    setState(() {
      _counter--;
    });
    await prefs.setInt("counter", _counter);
  }

  void _resetCounter() async {
    setState(() {
      _counter = 0;
    });

    await prefs.setInt("counter", _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        title: const Text("WaterCounter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Anzahl der Getränke"),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 64),
            Padding(
              padding: EdgeInsets.only(left: 32.0, right: 32.0),
              child: WCButton(
                onPressed: _incrementCounter,
                text: "Trinken",
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 32.0, right: 32.0),
              child: WCButton(
                // TODO: Missing function to remove a drink (_decrementCounter). DONE
                onPressed: _decrementCounter,
                text: "Getränk entfernen",
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 32.0, right: 32.0),
              child: WCButton(
                onPressed: _resetCounter,
                text: "Zähler zurücksetzen",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
