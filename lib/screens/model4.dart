import 'dart:math';

import 'package:flutter/material.dart';
import 'package:queues/constants.dart';

class Model4 extends StatefulWidget {
  @override
  _Model4State createState() => _Model4State();
}

class _Model4State extends State<Model4> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  double arrival_rate;
  double service_rate;
  int c;
  String l;
  String w;
  String wq;
  String lq;
  String ci;
  
  sigma(last, r){
    var sum = 0.0;
    for(int j = 0; j <= last; j++){
      sum += ((pow(r,j)) / (factorial(j)));
    }
    return sum;
  }

  sigma2(last){
    var sum = 0.0;
    for(int j = 0; j <= last; j++){
      sum += (1 / factorial(j)) * (pow((arrival_rate / service_rate), j));
    }
    return sum;
  }
  _calculate(){
    if(arrival_rate != null && service_rate != null && c != null){

      double p0 = 0;
      double r = arrival_rate / service_rate;
      double rho = r / c;

      double ws = 1/service_rate;

      double part1 = sigma(c - 1, r);
      double part2 = ((c * pow(r, c)) / (factorial(c) * (c - r)));
      double part11 = sigma2(c - 1);
      double part22 = (1 / factorial(c)) * (pow((arrival_rate / service_rate),  c)) * ((c * service_rate) / ((c * service_rate) - arrival_rate));


      if(r /c < 1){
        p0 = 1/(part1 + part2);
      }else if(r/c >= 1){
        p0 = 1/(part11 + part22);
      }
      setState(() {

        double lqUp = pow(r, c+1) / c;
        double lqDown = factorial(c) * pow((1-r)/c, 2); 
        lq = ((lqUp/ lqDown) * p0).toStringAsFixed(2);

        wq = (double.parse(lq) / arrival_rate).toStringAsFixed(2);
        w = (double.parse(lq) + (1 / service_rate)).toStringAsFixed(2);
        l = (double.parse(lq) + (arrival_rate / service_rate)).toStringAsFixed(2);
        ci = (((c - r) / c)).toStringAsFixed(2);
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
                        labelText: 'Enter C'
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
                        result('L = $l', context, MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height * .15),
                        result('W = $w', context, MediaQuery.of(context).size.width * .7, MediaQuery.of(context).size.height * .15),
                        result('Wq = $wq', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .2),
                        result(' Lq = $lq', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .15),
                        result(' Ci = $ci', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .15),
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