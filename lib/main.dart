import 'package:flutter/material.dart';
import 'package:memories/pages/home/home.dart';
import 'package:memories/services/level_service.dart';
import 'package:memories/services/storage_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _setUpTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Georgia',
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, brightness: Brightness.dark),
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences?>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final preferences = snapshot.data as SharedPreferences;
          final storageService = StorageService(preferences);
          return ChangeNotifierProvider(
            create: (context) => LevelService(storageService),
            builder: (context, child) {
              return MaterialApp(
                  title: 'Memories',
                  theme: _setUpTheme(),
                  // Use a future builder to await the access to shared preferences
                  home: const HomePage());
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
