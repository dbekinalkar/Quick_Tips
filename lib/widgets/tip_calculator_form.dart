import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_tips/providers/tip_provider.dart';

class TipCalculatorForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tipProvider = Provider.of<TipProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Bill Amount'),
            onChanged: (value) => tipProvider.updateBillAmount(double.parse(value)),
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Tip Percentage (%)'),
            onChanged: (value) => tipProvider.updateTipPercentage(double.parse(value)),
            // Set the default tip percentage to 15.
            controller: TextEditingController(text: '15'),
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Number of People'),
            onChanged: (value) => tipProvider.updateSplitBy(int.parse(value)),
            // Set the default number of people to 1.
            controller: TextEditingController(text: '1'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
            },
            child: Text('Calculate Tip'),
          ),
        ],
      ),
    );
  }
}
