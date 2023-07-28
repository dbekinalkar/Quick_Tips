import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_tips/providers/tip_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tipProvider = Provider.of<TipProvider>(context);
    final List<TipEntry> tips = tipProvider.tipEntries.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip History'),
      ),
      body: tips.isEmpty
          ? const Center(
              child: Text('No tips yet.'),
            )
          : ListView.builder(
              itemCount: tips.length,
              itemBuilder: (context, index) {
                final tipEntry = tips[index];
                return ListTile(
                  title: Text('Total Amount: \$${tipEntry.totalAmount.toStringAsFixed(2)}'),
                  subtitle: Text('Tip Percentage: ${tipEntry.tipPercentage}%'),
                  trailing: Text('Split Amount: \$${tipEntry.splitAmount.toStringAsFixed(2)}'),
                );
              },
            ),
    );
  }
}
