import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../model/hadeth_model.dart';

class HadethDetailsProvider extends ChangeNotifier {
  List<HadethModel> allAhadeth = [];

  void loadHadeth() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split('\n');
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadethModel hadethModel = HadethModel(title: title, content: content);
        allAhadeth.add(hadethModel);
        notifyListeners();
      }
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
    });
  }
}
