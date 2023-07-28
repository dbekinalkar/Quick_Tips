import 'package:flutter/material.dart';
import 'package:quick_tips/widgets/tip_result.dart';

class TipCalculationScreen extends StatelessWidget {
  const TipCalculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickTips - Tip Calculation'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TipResult(),
          ],
        ),
      ),
    );
  }
}
