import 'dart:math';

import 'package:flutter/painting.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight, this.age});
  final int height;
  final int weight;
  final int age;

  double _bmi;
  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underweight';
    }
  }

  String getInterpretations() {
    if (_bmi >= 25) {
      return 'You have heigher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'Great your BMI is Normal. looking great!';
    } else {
      return 'You have lower BMI than the normal body weight. Maybe eat a little more?';
    }
  }
}
