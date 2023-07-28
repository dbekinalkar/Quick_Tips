import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_tips/providers/tip_provider.dart';
import 'package:quick_tips/screens/tip_calculation_screen.dart';

class TipCalculatorForm extends StatefulWidget {
  const TipCalculatorForm({super.key});

  @override
  State<TipCalculatorForm> createState() => _TipCalculatorFormState();
}

class _TipCalculatorFormState extends State<TipCalculatorForm> {
  final _formKey = GlobalKey<FormState>();
  final _billAmountController = TextEditingController(text: '0');
  final _tipPercentageController = TextEditingController(text: '15');
  final _splitByController = TextEditingController(text: '1');

  bool _isBillAmountValid = true;
  bool _isTipPercentageValid = true;
  bool _isSplitByValid = true;

  @override
  void dispose() {
    _billAmountController.dispose();
    _tipPercentageController.dispose();
    _splitByController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isBillAmountValid = _formKey.currentState!.validate();
      _isTipPercentageValid = _formKey.currentState!.validate();
      _isSplitByValid = _formKey.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tipProvider = Provider.of<TipProvider>(context);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _billAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Bill Amount'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the bill amount.';
                }
                final billAmount = double.tryParse(value);
                if (billAmount == null || billAmount <= 0) {
                  return 'Please enter a valid bill amount.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _tipPercentageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Tip Percentage (%)'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the tip percentage.';
                }
                final tipPercentage = double.tryParse(value);
                if (tipPercentage == null || tipPercentage < 0) {
                  return 'Please enter a valid tip percentage.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _splitByController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number of People'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the number of people.';
                }
                final splitBy = int.tryParse(value);
                if (splitBy == null || splitBy <= 0) {
                  return 'Please enter a valid number of people.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: (_isBillAmountValid && _isTipPercentageValid && _isSplitByValid)
                  ? () {
                      tipProvider.updateBillAmount(double.parse(_billAmountController.text));
                      tipProvider.updateTipPercentage(double.parse(_tipPercentageController.text));
                      tipProvider.updateSplitBy(int.parse(_splitByController.text));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TipCalculationScreen()),
                      );
                    }
                  : null,
              child: const Text('Calculate Tip'),
            ),
          ],
        ),
      ),
    );
  }
}
