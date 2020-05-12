import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/Counter/CounterModel.dart';
import 'package:provider_demo/Counter/FirstPage.dart';
import 'package:provider_demo/LoaderContainer/LoaderStateModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          //加数器
          ChangeNotifierProvider<CounterModel>.value(value: CounterModel()),
          //loadingHub
          ChangeNotifierProvider<LoaderStateModel>.value(
              value: LoaderStateModel()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: MyHomePage(title: 'hello,provider!  '),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: RaisedButton(
              child: Text('点击进入Loding Hub'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FirstPage();
                }));
              })),
    );
  }
}
