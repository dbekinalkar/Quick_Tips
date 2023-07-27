import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_tips/providers/tip_provider.dart';
import 'package:quick_tips/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TipProvider(),
      child: MaterialApp(
        title: 'QuickTips',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    );
  }
}
