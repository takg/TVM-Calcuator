import 'package:flutter/material.dart';
import 'dart:math';

class Rate extends StatefulWidget {
  @override
  _Rate createState() {
    return _Rate();
  }

}

class _Rate extends State<Rate> {
  String futureValue;
  String presentValue;
  String duration;
  String rate;

  _Rate() {
    rate = '';
  }

  void computeRate() {
    double _futureValue = double.parse(futureValue);
    int _duration = int.parse(duration);
    double _presentValue = double.parse(presentValue);
    double _rate = 0.0;

    _rate = pow(_futureValue/_presentValue, 1/_duration) - 1;
    
    setState(() {
      rate = ((_rate * 10000).toInt().toDouble()/100.0).toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
        Column(
          children: <Widget>[
              TextField(
                maxLines: 1,
                textAlign: TextAlign.right,
                decoration: InputDecoration(labelText: " Enter present value amount",),
                onChanged: (String text) {
                  presentValue = text;
                  computeRate();
                },
                keyboardType: TextInputType.number,
              ),
              TextField(
                maxLines: 1,
                textAlign: TextAlign.right,
                decoration: InputDecoration(labelText: " Enter future value amount",),
                onChanged: (String text) {
                  futureValue = text;
                  computeRate();
                },
                keyboardType: TextInputType.number,
              ),
              TextField(
                maxLines: 1,
                textAlign: TextAlign.right,
                decoration: InputDecoration(labelText: " Enter period",),
                onChanged: (String text) {
                  duration = text;
                  computeRate();
                },
                keyboardType: TextInputType.number,
              ),
              Row(children: <Widget>[
                Text(
                  " Rate(%) : $rate ",
                  style: TextStyle(
                            fontSize: 18,
                            color: Colors.green
                            ),
                  ),
              ],),
              ],
        )
    );
  }
}