import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/LoaderContainer/LoaderStateModel.dart';
import 'package:provider_demo/LoaderContainer/LodingHubPage.dart';
import 'package:provider_demo/LoaderContainer/OrderDetailInfoPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'hello,provider!  '),
    );
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
                  return MultiProvider(providers: [
                    ChangeNotifierProvider<LoaderStateModel>.value(
                        value: LoaderStateModel(LoaderState.Succeed)),
                  ], child: OrderDetailInfoPage());
                }));
              })),
    );
  }
}
