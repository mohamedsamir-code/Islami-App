import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int counter = 0;
  double angle = 10;
  List<String> tasbehat = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int index = 0;

  sebhaTransform() {
    counter++;
    angle += 15;
    if (counter == 34) {
      if (index == 2) {
        index = 0;
      }
      index++;
      counter = 0;
    }
    notifyListeners();
  }
}
