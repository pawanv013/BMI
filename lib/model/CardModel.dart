import 'dart:math';

import 'package:flutter/cupertino.dart';

class CardModel extends ChangeNotifier {
  double _buttonHight = 70.0;
  double get buttonHight => _buttonHight;

  Color _buttonColor = Color(0xFFEB1555);
  Color get buttonColor => _buttonColor;

  Color _cardColor = Color(0xFF1D1E33);
  Color get cardColor => _cardColor;

  Color _inActiveCardColor = Color(0xFF111328);
  Color get inActiveCardColor => _inActiveCardColor;

  late String _selectedGender = '';
  String get genderSelected => _selectedGender;

  int _height = 150;
  int get height => _height;

  double _bmi = 0.0;
  double get bmi => _bmi;

  String _result = '';
  String get result => _result;

  String _interpretation = '';
  String get interpretation => _interpretation;

  set setHeight(int setHeight) {
    _height = setHeight;
    notifyListeners();
  }

  set selectedGender(selectedGender) {
    _selectedGender = selectedGender;
    notifyListeners();
  }

  int _weight = 10;
  int get weight => _weight;

  void minusWeight() {
    if (_weight > 5) {
      _weight--;
      notifyListeners();
    }
  }

  void plusWeight() {
    _weight++;
    notifyListeners();
  }

  int _age = 10;
  int get age => _age;

  void minusAge() {
    if (_age > 5) {
      _age--;
      notifyListeners();
    }
  }

  void plusAge() {
    _age++;
    notifyListeners();
  }

  calculateBMI() {
    _bmi = _weight / pow(_height / 100, 2);
    notifyListeners();
    if (_bmi >= 25) {
      _result = 'Overweight';
      _interpretation =
          'You have ahigher than normal body weight. Try to exercise more.';
      notifyListeners();
    } else if (_bmi > 18.5) {
      _result = 'Normal';
      _interpretation = 'You have a normal body weight. Good job!';
      notifyListeners();
    } else {
      _result = 'Underweight';
      _interpretation =
          'You have a lower than normal body weight. You can eat a bit more.';
      notifyListeners();
    }
  }
}
