import 'package:flutter/material.dart';
import 'dart:math';

class DCF extends StatefulWidget {
  @override
  _DCF createState() {
    return _DCF();
  }
}

class _DCF extends State<DCF> {
  String freeCashFlow;
  String growthRate;
  String discountedRate;
  String presentValue;

  _DCF() {
    presentValue = '';
  }

  void computePresentValue() {
    double _freeCashFlow = double.parse(freeCashFlow);
    double _discountedRate = double.parse(discountedRate)/100;
    double _growthRate = double.parse(growthRate)/100;
    double _presentValue = 0.0;
    
    for (int i = 1; i < 11; ++i) {
      // discounted present value of predicted future free cash flow
      _presentValue += _freeCashFlow * pow(1+_growthRate, i)/ pow(1+_discountedRate, i);
    }

    // terminal value
    _presentValue = _freeCashFlow * (1+_growthRate)/(_discountedRate - _growthRate);

    presentValue = _presentValue.toStringAsPrecision(6);
    setState((){});
  }

  @override Widget build(BuildContext context) {
    return Container(
      child: 
        Column(children: <Widget>[
            TextField(
              maxLines: 1,
              textAlign: TextAlign.right,
              decoration: InputDecoration(labelText: " Enter free cash flow",),
              onChanged: (String text) {
                freeCashFlow = text;
                computePresentValue();
              },
              keyboardType: TextInputType.number,
            ),          
           TextField(
              maxLines: 1,
              textAlign: TextAlign.right,
              decoration: InputDecoration(labelText: " Enter discount rate(%) [i.e required rate of return]",),
              onChanged: (String text) {
                discountedRate = text;
                computePresentValue();
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              maxLines: 1,
              textAlign: TextAlign.right,
              decoration: InputDecoration(labelText: " Enter growth rate(%)",),
              onChanged: (String text) {
                growthRate = text;
                computePresentValue();
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10,),
            Text(
              " Present Value is $presentValue",
              style: TextStyle(
                            fontSize: 18,
                            color: Colors.green
                            ),
                  ),
        ],)
      ,);
  }
}