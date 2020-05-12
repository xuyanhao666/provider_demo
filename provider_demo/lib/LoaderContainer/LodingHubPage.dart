import 'package:flutter/material.dart';

enum LoaderState { NoAction, Loading, Succeed, Faild, NoData }

class LoadingHubView extends StatefulWidget {
  LoadingHubView(
      {Key key,
      @required this.loaderState,
      this.loadingView,
      this.errorView,
      this.emptyView,
      @required this.contentView,
      this.onReload})
      : super(key: key);

  final LoaderState loaderState;
  final Widget loadingView;
  final Widget errorView;
  final Widget emptyView;
  final Widget contentView;
  final Function onReload;

  @override
  _LoadingHubViewState createState() => _LoadingHubViewState();
}

class _LoadingHubViewState extends State<LoadingHubView> {
  @override
  Widget build(BuildContext context) {
    Widget currentWidget;
    switch (widget.loaderState) {
      case LoaderState.Loading:
        currentWidget = widget.loadingView ?? _ClassicalLoadingView();
        break;
      case LoaderState.Faild:
        currentWidget = widget.errorView ??
            _ClassicalErrorView(onReload: () => widget.onReload);
        break;
      case LoaderState.NoAction:
        currentWidget = widget.contentView;
        break;
      case LoaderState.NoData:
        currentWidget = widget.emptyView ?? _ClassicalNoDataView();
        break;
      case LoaderState.Succeed:
        currentWidget = widget.contentView;
        break;
    }
    return currentWidget;
  }
}

class _ClassicalLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                '正在拼命加载中...',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
}

class _ClassicalErrorView extends StatelessWidget {
  _ClassicalErrorView({@required this.onReload}) : super();

  final Function onReload;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'asset/img/default_load_data_failed.png',
              width: 80,
              height: 80,
              color: Color(0xff999999),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                '加载失败，请稍后点击重试',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff999999),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                color: Colors.brown,
                onPressed: onReload,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    '重新加载',
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class _ClassicalNoDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'asset/img/default_load_data_no_data.png',
              width: 80,
              height: 80,
              color: Color(0xff999999),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                '暂无相关数据 /(ㄒoㄒ)/~~',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff999999),
                ),
              ),
            ),
          ],
        ),
      );
}
