import 'package:flutter/material.dart';
import 'package:provider_demo/LoaderContainer/LodingHubPage.dart'
    as LoaderStater;

//加载器的状态model
class LoaderStateModel extends ChangeNotifier {
  LoaderStater.LoaderState _state;

  //构造函数
  LoaderStateModel([this._state]) {
    this._state = this._state ?? LoaderStater.LoaderState.Loading;
  }

  //修改状态
  void changeState(LoaderStater.LoaderState state) {
    _state = state;
    notifyListeners();
  }

  //获取当前加载器的状态
  //提供外部能够访问的数据
  LoaderStater.LoaderState get state => _state;
}
