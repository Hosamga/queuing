import 'dart:math';

import 'package:flutter/material.dart';
import 'package:queues/constants.dart';

class Model3 extends StatefulWidget {
  @override
  _Model3State createState() => _Model3State();
}

class _Model3State extends State<Model3> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  double arrival_time;
  double arrival_rate;
  double service_rate;
  double service_time;
  int k;
  int m;
  String l;
  String w;
  String wq;
  String lq;
  
  _calculate(){
    if(arrival_rate != null && service_rate != null && k != null){

      // double arrival_rate = 1 / arrival_time;
      // double service_rate = 1 / service_time;
      double rho = arrival_rate / service_rate;
      double ws = 1/service_rate;

      double pn;

      if(rho == 1){
        pn = 1 / (k+1);
        setState(() {
          l = (k/2).toStringAsFixed(2);
          w = (double.parse(l) / (arrival_rate * (1-pn))).toStringAsFixed(2);
          wq = (double.parse(w) - ws).toStringAsFixed(2);
          lq = (arrival_rate * (1 - pn) * double.parse(wq)).toStringAsFixed(2);
        });
      }else{
        print('no');
        pn = (pow(rho ,k) * ((1 - rho)/ (1-pow(rho, k))));

        setState(() {
          double up = (1 - (k+1)*pow(rho, k) + k * pow(rho, k+1));
          double down = (1-rho) * (1-pow(rho, k+1));
          l = (rho * (up/down)).toStringAsFixed(2);
          w = (double.parse(l) / (arrival_rate * (1-pn))).toStringAsFixed(2);
          wq = (double.parse(w) - ws).toStringAsFixed(2);
          lq = (arrival_rate * (1 - pn) * double.parse(wq)).toStringAsFixed(2);
        });
      }
      
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(8, 4, 92, 1),
        title: Text(
          'M / M / 1 / k',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Arrival Rate'
                      ),
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Please fill this input';
                        }
                        if(double.tryParse(value) == null){
                          return 'Please enter a valid number';
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          l = null;
                          arrival_rate = double.tryParse(value);
                        });
                        print(arrival_rate);
                      },
                      onSaved: (newValue) {
                        arrival_rate = double.parse(newValue);
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Service Rate'
                      ),
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Please fill this input';
                        }
                        if(double.tryParse(value) == null){
                          return 'Please enter a valid number';
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          l = null;
                          service_rate = double.tryParse(value);
                        });
                        
                        print(service_rate);
                      },
                      onSaved: (newValue) {
                        service_rate = double.parse(newValue);
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter k'
                      ),
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Please fill this input';
                        }
                        if(int.tryParse(value) == null){
                          return 'Please enter a valid number';
                        }
                      },
                      onSaved: (newValue) {
                        k = int.parse(newValue);
                      },
                    ),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    height: MediaQuery.of(context).size.height * .06,
                    child: RaisedButton(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      onPressed: () {
                        if(!_key.currentState.validate()){
                          return;
                        }
                        _key.currentState.save();
                        print(arrival_rate);
                        print(service_rate);
                        print(k);
                        _calculate();
                      },
                    ),
                  ),
                  arrival_rate != null && service_rate != null && k != null && l != null && w != null && wq != null && lq != null ?
                    Column(
                      children: [
                        Divider(color: Colors.black,),
                        result('L = $l', context, MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height * .15),
                        result('W = $w', context, MediaQuery.of(context).size.width * .7, MediaQuery.of(context).size.height * .15),
                        result('Wq = $wq', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .2),
                        result(' Lq = $lq', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .15),
                      ],
                    )
                  : SizedBox()
                ],
              ),
            ),
          ),
        ),
    );
  }
}