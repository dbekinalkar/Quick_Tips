import 'package:flutter/foundation.dart';
import 'package:quick_tips/models/tip_calculator.dart';

class TipProvider with ChangeNotifier {
  TipCalculator _tipCalculator = TipCalculator();

  TipCalculator get tipCalculator => _tipCalculator;

  void updateBillAmount(double billAmount) {
    _tipCalculator.billAmount = billAmount;
    notifyListeners();
  }

  void updateTipPercentage(double tipPercentage) {
    _tipCalculator.tipPercentage = tipPercentage;
    notifyListeners();
  }

  void updateSplitBy(int splitBy) {
    _tipCalculator.splitBy = splitBy;
    notifyListeners();
  }
}
