import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/Counter/CounterModel.dart';
import 'package:provider_demo/LoaderContainer/LoaderStateModel.dart';
import 'package:provider_demo/LoaderContainer/LodingHubPage.dart' as loader;

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Center(
        child: Text("${Provider.of<CounterModel>(context).count}" +
            ' - ${Provider.of<LoaderStateModel>(context).state}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterModel>(context, listen: false).increment();
          Provider.of<LoaderStateModel>(context, listen: false)
              .changeState(loader.LoaderState.Succeed);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
