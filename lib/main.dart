import 'package:flutter/material.dart';
import 'package:photo_quiz/pages/home/home.dart';
import 'package:photo_quiz/services/level_service.dart';
import 'package:photo_quiz/services/storage_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                  title: 'Photo Quiz',
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
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
