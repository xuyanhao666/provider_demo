import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  //储存数据
  int _count = 0;

  //提供外部能够访问的数据
  int get count => _count;

  void increment() {
    _count++;
    //通知所有听众刷新
    notifyListeners();
  }
}
