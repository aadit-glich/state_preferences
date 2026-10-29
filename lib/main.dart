import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import package provider
import 'providers/user_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // LATIHAN 4: Menggunakan ChangeNotifierProvider
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'State & Preferences',
            debugShowCheckedModeBanner: false,
            // Tema dinamis menggunakan state dari Provider
            themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(useMaterial3: true),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}