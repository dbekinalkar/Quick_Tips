class TipCalculator {
  double billAmount;
  double tipPercentage;
  int splitBy;

  TipCalculator({this.billAmount = 0, this.tipPercentage = 15, this.splitBy = 1});

  // Calculated properties
  double get totalAmount {
    return billAmount + (billAmount * (tipPercentage / 100));
  }

  double get tipAmount {
    return billAmount * (tipPercentage / 100);
  }

  double get splitAmount {
    return totalAmount / splitBy;
  }
}
