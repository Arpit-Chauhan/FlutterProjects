import 'dart:math';

import 'package:flutter/material.dart';

class Calculator {
  Calculator(this.height, this.weight);

  final int height;
  final int weight;
  double ans;

  String BmiCalculate() {
    ans = weight / pow(height / 100, 2);
    return ans.toStringAsFixed(1);
  }

  String getRes() {
    if (ans > 25)
      return 'Overweight';
    else if (ans > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getSug() {
    if (ans > 25)
      return 'You should do some exercise';
    else if (ans > 18.5)
      return 'Normal,Nice Job';
    else
      return 'You should eat more';
  }
}
