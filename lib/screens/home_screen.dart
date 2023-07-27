import 'package:flutter/material.dart';
import 'package:quick_tips/widgets/tip_calculator_form.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuickTips - Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TipCalculatorForm(),
          ],
        ),
      ),
    );
  }
}
