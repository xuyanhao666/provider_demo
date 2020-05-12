import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/Counter/CounterModel.dart';
import 'package:provider_demo/Counter/SecondPage.dart';
import 'package:provider_demo/LoaderContainer/LoaderStateModel.dart';
import 'package:provider_demo/LoaderContainer/LodingHubPage.dart' as loader;

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
        actions: <Widget>[
          FlatButton(
            child: Text("下一页"),
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondPage();
              })),
            },
          )
        ],
      ),
      body: Consumer<CounterModel>(builder: (context, counterModel, _) {
        return Center(
          child: Text("${counterModel.count}" +
              ' - ${Provider.of<LoaderStateModel>(context).state}'),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterModel>(context, listen: false).increment();
          Provider.of<LoaderStateModel>(context, listen: false)
              .changeState(loader.LoaderState.Loading);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
