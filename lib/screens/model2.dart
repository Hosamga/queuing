import 'package:flutter/material.dart';

class Model2 extends StatefulWidget {
  @override
  _Model2State createState() => _Model2State();
}

class _Model2State extends State<Model2> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  double arrival_time;
  double service_time;
  int k;
  int m;
  int l;
  int w;
  int wq;
  int lq;
  
  _calculate(){
    if(arrival_time != null && service_time != null){

      double arrival_rate = 1 / arrival_time;
      double service_rate = 1 / service_time;
      setState(() {
        print(arrival_rate);
        print(service_rate);
        l = (arrival_rate / (service_rate - arrival_rate)).floor();
        w = (1/ (service_rate - arrival_rate)).floor();
        wq = (l * (1/service_rate)).floor();
        lq = ((arrival_rate * arrival_rate) / (service_rate * (service_rate - arrival_rate))).floor();
      });
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
          'M / M / 1 ',
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
                        labelText: 'Arrival Time'
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
                          arrival_time = double.tryParse(value);
                        });
                        print(arrival_time);
                      },
                      onSaved: (newValue) {
                        arrival_time = double.parse(newValue);
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Service Time'
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
                          service_time = double.tryParse(value);
                        });
                        
                        print(service_time);
                      },
                      onSaved: (newValue) {
                        service_time = double.parse(newValue);
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
                      onPressed: arrival_time == null && service_time == null ? null : () {
                        if(!_key.currentState.validate()){
                          return;
                        }
                        _key.currentState.save();
                        print(arrival_time);
                        print(service_time);
                        print(k);
                        _calculate();
                      },
                    ),
                  ),
                  arrival_time != null && service_time != null && l != null && w != null && wq != null && lq != null ?
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