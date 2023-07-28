import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_tips/providers/tip_provider.dart';
import 'package:quick_tips/screens/home_screen.dart';
import 'package:quick_tips/screens/tip_calculation_screen.dart';
import 'package:quick_tips/screens/history_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TipProvider(),
      child: MaterialApp(
        title: 'QuickTips',
        theme: ThemeData(
          primarySwatch: Colors.green, // 
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Color for elevated buttons
              foregroundColor: Colors.white, // Text color for elevated buttons
            ),
          ),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/tipCalculation': (context) => const TipCalculationScreen(),
          '/history': (context) => HistoryScreen(),
        },
      ),
    );
  }
}
