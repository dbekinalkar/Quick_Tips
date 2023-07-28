import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_tips/providers/tip_provider.dart';

class TipResult extends StatelessWidget {
  const TipResult({super.key});

  @override
  Widget build(BuildContext context) {
    final tipProvider = Provider.of<TipProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Total Amount: \$${tipProvider.tipCalculator.totalAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Tip Amount: \$${tipProvider.tipCalculator.tipAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            'Split Amount: \$${tipProvider.tipCalculator.splitAmount.toStringAsFixed(2)} per person',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
