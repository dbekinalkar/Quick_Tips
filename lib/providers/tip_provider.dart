import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:quick_tips/models/tip_calculator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TipProvider with ChangeNotifier {
  TipCalculator _tipCalculator = TipCalculator();

  TipCalculator get tipCalculator => _tipCalculator;

  List<TipEntry> _tipEntries = [];

  List<TipEntry> get tipEntries => _tipEntries;

  late SharedPreferences _prefs;
  static const String _tipHistoryKey = 'tip_history';

  TipProvider() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _loadTipHistory();
  }

  // Store the tip history in shared preferences.
  Future<void> _saveTipHistory() async {
    final List<String> tipHistoryJsonList =
        _tipEntries.map((tipEntry) => json.encode(tipEntry.toJson())).toList();
    await _prefs.setStringList(_tipHistoryKey, tipHistoryJsonList);
  }

  // Retrieve the tip history from shared preferences.
  void _loadTipHistory() {
    final List<String>? tipHistoryJsonList =
        _prefs.getStringList(_tipHistoryKey);
    if (tipHistoryJsonList != null) {
      _tipEntries = tipHistoryJsonList
          .map((jsonString) => TipEntry.fromJson(json.decode(jsonString)))
          .toList();
      notifyListeners();
    }
  }

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

  void addTipEntry(TipEntry tipEntry) {
    _tipEntries.add(tipEntry);
    notifyListeners();
    _saveTipHistory();
  }

  void calculateTipAndAddToHistory() {
    final tipCalculator = this.tipCalculator;

    final tipEntry = TipEntry(
      totalAmount: tipCalculator.totalAmount,
      tipPercentage: tipCalculator.tipPercentage,
      splitAmount: tipCalculator.splitAmount,
    );

    _tipEntries.add(tipEntry);
    notifyListeners();
    _saveTipHistory();
  }
}

class TipEntry {
  final double totalAmount;
  final double tipPercentage;
  final double splitAmount;

  TipEntry({
    required this.totalAmount,
    required this.tipPercentage,
    required this.splitAmount,
  });

  Map<String, dynamic> toJson() {
    return {
      'totalAmount': totalAmount,
      'tipPercentage': tipPercentage,
      'splitAmount': splitAmount,
    };
  }

  factory TipEntry.fromJson(Map<String, dynamic> json) {
    return TipEntry(
      totalAmount: json['totalAmount'],
      tipPercentage: json['tipPercentage'],
      splitAmount: json['splitAmount'],
    );
  }
}
