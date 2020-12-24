import 'dart:math';

import 'package:flutter/material.dart';

class Model4 extends StatefulWidget {
  @override
  _Model4State createState() => _Model4State();
}

class _Model4State extends State<Model4> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  double arrival_time;
  double arrival_rate;
  double service_rate;
  double service_time;
  int c;
  int m;
  String l;
  String w;
  String wq;
  String lq;
  String ci;
  
  sigma(last, r){
    var sum = 0.0;
    List x = [];
    for(int i = 0; i <= last + 1; i++){
      x.add(i);
    }
    for(int j in x){
      sum += ((pow(r,j)) / (factorial(j)));
    }
    return sum;
  }

  sigma2(last){
    var sum = 0.0;
    List x = [];
    for(int i = 0; i <= last + 1; i++){
      x.add(i);
    }
    for(int j in x){
      sum += (1 / factorial(j)) * (pow((arrival_rate / service_rate), j));
    }
    return sum;
  }
  _calculate(){
    if(arrival_rate != null && service_rate != null && c != null){

      // double arrival_rate = 1 / arrival_time;
      // double service_rate = 1 / service_time;
      double p0 = 0;
      double r = arrival_rate / service_rate;
      double rho = r / c;

      double ws = 1/service_rate;

       double part1 = sigma(c - 1, r);
      double part2 = ((c * (pow(r, 3))) / (factorial(c) * (c - r)));
      double part11 = sigma2(c - 1);
      double part22 = (1 / factorial(c)) * (pow((arrival_rate / service_rate),  c)) * ((c * service_rate) / ((c * service_rate) - arrival_rate));


      if(r /c < 1){
        p0 = 1/(part1 + part2);
      }else if(r/c >= 1){
        p0 = 1/(part11 + part22);
      }
      setState(() {
        lq = ((((r * (c + 1)) / c) / (factorial(c) * (((1 - r) / c) * 2))) * p0).toStringAsFixed(2);
        wq = (double.parse(lq) / arrival_rate).toStringAsFixed(2);
        w = (double.parse(wq) + (1 / service_rate)).toStringAsFixed(2);
        l = (double.parse(lq) + (arrival_rate / service_rate)).toStringAsFixed(2);
        ci = (((c - r) / c) * (100)).toStringAsFixed(2);
      });
      // print('row ${(1/rho) / (1+rho)}');
      // if(rho < 1){
      //   double p = 0;
      //   for(int i = 0; i <= c-1; i++){
      //     p += ((pow(r, i)/factorial(i)) + ((c * pow(r, c)) / (factorial(c) * (c-r))));
      //   }
      //   p0 = 1/p;
      //   print('p0 $p0');
      // }else if(rho >= 1){
      //   double p = 0;
      //   for(int i = 0; i <= c-1; i++){
      //     p += ((1/factorial(i) * pow((arrival_rate/service_rate), i)) + ((1/factorial(c)) * pow(arrival_rate/service_rate, c) * ((c/service_rate)/((c * service_rate) - arrival_rate))));
      //   }
      //   p0 = 1/p;
      //   print('p0 $p0');
      // }
      // p0 = 17;
      // print(p0);
      // setState(() {
      //   lq = (((pow(r, c+1)/c) / (factorial(c) * (1-pow(r/c, 2)))) * p0).toStringAsFixed(2);
      //   wq = (double.parse(lq)/arrival_rate).toStringAsFixed(2);
      //   w = ((double.parse(lq) / arrival_rate) + 1/service_rate).toStringAsFixed(2);
      //   l = (double.parse(lq) + (arrival_rate/service_rate)).toStringAsFixed(2);
      //   ci = (c-r).toStringAsFixed(2);
      //   print(lq);
      // });


      
    }
  }

  int factorial(int n) {
    if (n < 0) throw ('Negative numbers are not allowed.');
    return n <= 1 ? 1 : n * factorial(n - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(8, 4, 92, 1),
        title: Text(
          'M / M / C',
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
                        c = int.parse(newValue);
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
                        print(c);
                        _calculate();
                      },
                    ),
                  ),
                  arrival_rate != null && service_rate != null && c != null && l != null && w != null && wq != null && lq != null ?
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
                                      ' Ci = $ci',
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