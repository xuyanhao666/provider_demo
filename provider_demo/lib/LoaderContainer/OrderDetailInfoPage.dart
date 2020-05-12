import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/LoaderContainer/LoaderStateModel.dart';
import 'package:provider_demo/LoaderContainer/LodingHubPage.dart';

class OrderDetailInfoPage extends StatefulWidget {
  OrderDetailInfoPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderDetailInfoPageState();
}

class _OrderDetailInfoPageState extends State<OrderDetailInfoPage>
    with TickerProviderStateMixin {
  /// 加载状体模型
  LoaderStateModel _loaderStateModel;

  /// 调用网络获取订单详情信息
  void _getOrderDetailInfo() async {
    _loaderStateModel.changeState(LoaderState.Loading);
    Future.delayed(Duration(seconds: 1), () {
      //模拟数据调用
      _loaderStateModel.changeState(LoaderState.Succeed);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // 初始化加载器的状态
    final loaderStateModel = Provider.of<LoaderStateModel>(context);

    if (this._loaderStateModel != loaderStateModel) {
      this._loaderStateModel = loaderStateModel;
      Future.microtask(() =>
          _getOrderDetailInfo()); //必须要这么做，不然可能会抛出异常，使用Future.microtask执行初始化任务
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: _buildContentView(context),
      );

  /// 构建AppBar视图
  Widget _buildAppBar() => AppBar(
        title: Text('订单详情'),
        centerTitle: true,
        elevation: 0.5,
      );

  /// 构建页面主视图
  Widget _buildContentView(BuildContext context) => Consumer<LoaderStateModel>(
        //使用Consumer处理共享值
        builder: (context, loaderStateModel, _) => LoadingHubView(
          loaderState: loaderStateModel.state,
          onReload: _getOrderDetailInfo,
          contentView: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, item) {
                    return ListTile(
                      leading: Icon(
                        Icons.assessment,
                        color: Colors.black,
                      ),
                      title: Text(
                        'hello,provider!',
                        style: TextStyle(color: Colors.blue),
                      ),
                      subtitle: Text(
                        'try my best!',
                        style: TextStyle(color: Colors.blue),
                      ),
                      isThreeLine: true,
                    );
                  },
                  physics: BouncingScrollPhysics(),
                  itemCount: 17,
                ),
              ),
            ],
          ),
        ),
      );
}
