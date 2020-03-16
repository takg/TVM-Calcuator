import 'package:flutter/material.dart';
import 'future_value.dart';
import 'present_value.dart';
import 'rate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: 3,
        child: 
          Scaffold(
            appBar: AppBar(
                title: Text("TVM Calculator"),
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Future Value",),
                    Tab(text: "Present Value",),
                    Tab(text: "Rate (%)",),
                  ]
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  FutureValue(),
                  PresentValue(),
                  Rate(),
                ],
              )
          ),
        ),
    );
  }
}

