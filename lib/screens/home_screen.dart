import 'package:flutter/material.dart';
import 'package:quick_tips/screens/history_screen.dart';
import 'package:quick_tips/widgets/tip_calculator_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickTips - Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TipCalculatorForm(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HistoryScreen()),
                );
              },
              child: const Text("History"),
            ),
          ],
        ),
      ),
    );
  }
}
