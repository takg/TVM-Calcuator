import 'package:flutter/material.dart';
import 'dart:math';

class PresentValue extends StatefulWidget {
  @override
  _PresentValue createState() {
    return _PresentValue();
  }

}

class _PresentValue extends State<PresentValue> {
  String futureValue;
  String presentValue;
  String duration;
  String rate;

  _PresentValue() {
    presentValue = '';
  }

  void computePresentValue() {
    double _futureValue = double.parse(futureValue);
    int _duration = int.parse(duration);
    double _rate = double.parse(rate)/100;
    double _presentValue = 0.0;

    _presentValue = _futureValue/pow(1+_rate, _duration);
    
    setState(() {
      presentValue = ((_presentValue * 100).toInt().toDouble()/100.0).toString();
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
                decoration: InputDecoration(labelText: " Enter future value amount",),
                onChanged: (String text) {
                  futureValue = text;
                  computePresentValue();
                },
                keyboardType: TextInputType.number,
              ),
              TextField(
                maxLines: 1,
                textAlign: TextAlign.right,
                decoration: InputDecoration(labelText: " Enter period",),
                onChanged: (String text) {
                  duration = text;
                  computePresentValue();
                },
                keyboardType: TextInputType.number,
              ),
              TextField(
                maxLines: 1,
                textAlign: TextAlign.right,
                decoration: InputDecoration(labelText: " Enter rate(%)",),
                onChanged: (String text) {
                  rate = text;
                  computePresentValue();
                },
                keyboardType: TextInputType.number,
              ),
              Row(children: <Widget>[
                Text(
                  " Present Value : $presentValue",
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