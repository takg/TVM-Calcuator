import 'package:flutter/material.dart';
import 'dart:math';

class FutureValue extends StatefulWidget {
  @override
  _FutureValue createState() {
    return _FutureValue();
  }
}

enum Frequency {
  ANNUAL,
  MONTHLY
}

class _FutureValue extends State<FutureValue> {
  String presentValue;
  String annuity;
  String rate;
  String duration;
  String futureValue;
  Frequency frequency;

  _FutureValue() {
    futureValue = '';
    frequency = Frequency.ANNUAL;
  }

  void computeFutureValue() {
    //print('Amount: $presentValue Rate:$rate Duration:$duration Annuity:$annuity');
    
    double _presentValue = double.parse(presentValue);
    int _duration = int.parse(duration);
    double _rate = double.parse(rate)/100;
    double _futureValue;
    double _annuity = 0.0;

    if (annuity != '' && annuity != null) {
      _annuity = double.parse(annuity);
    }
    //print('amount: $_presentValue Rate:$_rate Duration:$_duration Annuity:$_annuity');

    if (_annuity == null) {
      _annuity = 0.0;
    }

    if (frequency == Frequency.MONTHLY) {
      _rate = _rate / 12;
    }

    _futureValue = _presentValue*pow(1+_rate, _duration) + 
                         _annuity*(pow(1+_rate, _duration) -1) / _rate;

    setState(() {
      futureValue = ((_futureValue * 100).toInt().toDouble()/100.0).toString();
    });
  }

  @override Widget build(BuildContext context) {
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
                computeFutureValue();
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              maxLines: 1,
              textAlign: TextAlign.right,
              decoration: InputDecoration(labelText: " Enter annuity amount",),
              onChanged: (String text) {
                annuity = text;
                computeFutureValue();
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(labelText: " Rate(% p.a.)",),
              textAlign: TextAlign.right,
              onChanged: (String text) {
                rate = text;
                computeFutureValue();
              },
              keyboardType: TextInputType.number,
            ), 
             TextField(
              maxLines: 1,
              textAlign: TextAlign.right,
              decoration: InputDecoration(labelText: " Duration of period",),
              onChanged: (String text) {
                duration = text;
                computeFutureValue();
              },
              keyboardType: TextInputType.number,
            ), 
            Row(children: <Widget>[
              Text(" Frequency:  Annually"),
              Radio(
                value: Frequency.ANNUAL,
                groupValue: frequency,
                onChanged: (Frequency x){
                  frequency = Frequency.ANNUAL;
                  computeFutureValue();
                },
                ),
              Text("Monthly"),
              Radio(
                value: Frequency.MONTHLY,
                groupValue: frequency,
                onChanged: (Frequency x){
                  frequency = Frequency.MONTHLY;
                  computeFutureValue();
                },
                ),              ],
            ),
            SizedBox(height: 10,),
            Row(children: <Widget>[
              Text(
                  " Future Value: $futureValue", 
                  style: TextStyle(
                            fontSize: 18,
                            color: Colors.green
                            ),
                  ),
            ],)
        ]
      ,)
    ,);
  }
}