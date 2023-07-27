import 'package:flutter/foundation.dart';
import 'package:quick_tips/models/tip_calculator.dart';

class TipProvider with ChangeNotifier {
  final TipCalculator _tipCalculator = TipCalculator();

  TipCalculator get tipCalculator => _tipCalculator;

  void updateBillAmount(double billAmount) {
    _tipCalculator.billAmount = billAmount;
    notifyListeners();
  }
}
