import 'dart:math';

import 'package:flutter/material.dart';

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
      double row = arrival_rate / service_rate;
      double ws = 1/service_rate;

      double pn;

      if(row == 1){
        pn = 1 / (k+1);
        setState(() {
          l = (k/2).toStringAsFixed(2);
          w = (double.parse(l) / (arrival_rate * (1-pn))).toStringAsFixed(2);
          wq = (double.parse(w) - ws).toStringAsFixed(2);
          lq = (arrival_rate * (1 - pn) * double.parse(wq)).toStringAsFixed(2);
        });
      }else{
        pn = (pow(row ,k) * ((1 - row)/ (1-pow(row, k))));

        setState(() {
          double up = (1 - (k+1)*pow(row, k) + k * pow(row, k+1));
          double down = (1-row) * (1-pow(row, k+1));
          l = (row * (up/down)).toStringAsFixed(2);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .4,
                              height: MediaQuery.of(context).size.height * .15,
                              padding: EdgeInsets.all(18),
                              child: Card(
                                elevation: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'L = $l',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .7,
                              height: MediaQuery.of(context).size.height * .15,
                              padding: EdgeInsets.all(18),
                              child: Card(
                                elevation: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'W = $w',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .95,
                              height: MediaQuery.of(context).size.height * .2,
                              padding: EdgeInsets.all(18),
                              child: Card(
                                elevation: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Wq = $wq',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .95,
                              height: MediaQuery.of(context).size.height * .15,
                              padding: EdgeInsets.all(18),
                              child: Card(
                                elevation: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      ' Lq = $lq',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        
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