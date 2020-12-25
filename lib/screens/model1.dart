import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:queues/constants.dart';

class Model1 extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  @override
  _Model1State createState() => _Model1State();
}

class _Model1State extends State<Model1> {

   final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex;

  bool isPlaying = false;


  GlobalKey<FormState> _key = GlobalKey<FormState>();

  double arrival_time;
  double service_time;
  int k;
  int m;
  int ti;
  List n_group;
  
  _calculate_ti(){
    if(arrival_time != null && service_time != null){

      double arrival_rate = 1 / arrival_time;
      double service_rate = 1 / service_time;
      if(arrival_rate > service_rate){
        int result = ((k - (service_rate/arrival_rate)) / (arrival_rate - service_rate)).floor();
        print('result $result'); 
        int n = k;
        int t = result;

        while(n == k){
          t--;
          print(t);
          n = (arrival_rate * t).floor() - ((service_rate * t) - (service_rate/arrival_rate)).floor();
          print(n);
        }
        //result = i;
        result = t + 1;
        print(result);
        setState(() {
          ti = result;
        });
        kChart(ti);
      }else if(arrival_rate < service_rate){

          int t = (m / (service_rate - arrival_rate)).floor();
          int n = m;
          int i;
          for(i = 0; i < t; i++){
            n = m + ((1/arrival_time) * i).floor() - ((1/service_time) * i).floor(); 
            if(n == 0){
              break;
            }   
          }
          t = i;
          
        setState((){
          ti = t;
        });
        mChart(ti);
        
        print(ti);
      }
    }
  }

  List<Map> mGroup = [];
  List<Map> kGroup = [];

  kChart(ti){
    int t = ti;

    List ti_group = [];
    List n_group = [];
    List<Map> group_inside = [];

    for(int i = 0; i <= t; i+=2){
      ti_group.add(i);
      n_group.add(
        ((1/arrival_time) * i).floor() - (((1/service_time) * i) - ((1/service_time) / (1/arrival_time))).floor()
      );
    }

    for(int i = 1; i < ti_group.length; i++){
      group_inside.add({
        't': ti_group[i],
        'n': n_group[i]
      });
    }
    setState(() {
      kGroup = group_inside;
    });


  }

  mChart(ti){
    List<int> ti_group = [];
    List<int> n_group = [];
    List<Map> group_inside = [];
    
    ti_group.add(0);
    n_group.add(
      m
    );
    group_inside.add(
      {
        't': 0,
        'n': m
      }
    );

    for(int i = 1; i <= ti; i++){
      ti_group.add(i);
      n_group.add(
        m + ((1/arrival_time) * i).floor() - ((1/service_time) * i).floor()
      );
    }
    
    print('ti group ${ti_group.length}');
    print('n group ${n_group.length}');
    for(int j = 1; j < ti_group.length; j++){
      group_inside.add(
        {
          't': ti_group[j],
          'n': n_group[j]
        }
      );
    }
    print('group ${group_inside}');
    setState(() {
      mGroup = group_inside;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(8, 4, 92, 1),
        title: Text(
          'D / D / 1 / k-1',
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
                          ti = null;
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
                          ti = null;
                          service_time = double.tryParse(value);
                        });
                        
                        print(service_time);
                      },
                      onSaved: (newValue) {
                        service_time = double.parse(newValue);
                      },
                    ),
                  ),
                  arrival_time != null && service_time != null && (1/service_time) < (1/arrival_time) ? Container(
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
                  ) : 
                  arrival_time != null && service_time != null && (1/service_time) < (1/arrival_time) ? Container(
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
                  ) :
                  arrival_time != null && service_time != null && (1/service_time) >= (1/arrival_time) ? Container(
                    width: MediaQuery.of(context).size.width * .7,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter Initial value of Customers'
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
                        m = int.parse(newValue);
                      },
                    ),
                  ) : SizedBox()
                  ,
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
                        _calculate_ti();
                      },
                    ),
                  ),
                  arrival_time != null && service_time != null && (1/service_time) < (1/arrival_time) && k != null &&ti != null ?
                    Column(
                      children: [
                        Divider(color: Colors.black,),
                        result('ti is $ti', context, MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height * .15),
                        result('when   t < 1/λ   ⮕  n(t) = 0', context, MediaQuery.of(context).size.width * .7, MediaQuery.of(context).size.height * .15),
                        result('when \n  1/λ <= t < ti   ⮕  n(t) \n = [ 1/${arrival_time.floor()} t ] - [ 1/${service_time.floor()} t - $arrival_time/$service_time ]', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .2),
                        result(' when  \n  t >= ti   ⮕  n(t) alternates between ${k-1} and ${k-2}', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .15),
                        Divider(color: Colors.black),
                        result(' when   n = 0   ⮕  wq(n) = 0', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .15),
                        result(' when  \n n < λ ti   ⮕  wq(n) = ${((1/(1/service_time)) / (1/(1/arrival_time))).floor()} ( n - 1)', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .15),
                        result(' when  \n n >= λ ti   ⮕  wq(n) alternates between  \n ${((1/(1/service_time)) / (1/(1/arrival_time))).floor() * (((1/arrival_time) * ti) - 2)} And  ${((1/(1/service_time)) / (1/(1/arrival_time))).floor() * (((1/arrival_time) * ti) - 3)}', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .2),
                         BarChart(BarChartData(
                          axisTitleData: FlAxisTitleData(
                            bottomTitle: AxisTitle(
                              showTitle: true,
                              titleText: 'Time',
                              textAlign: TextAlign.center
                            ),
                            leftTitle: AxisTitle(
                              showTitle: true,
                              titleText: 'n(t)',
                              textAlign: TextAlign.center
                            ),
                          ),
                          borderData: FlBorderData(
                          border: Border(
                            top: BorderSide.none,
                            right: BorderSide.none,
                            left: BorderSide(width: 1),
                            bottom: BorderSide(width: 1),
                        )),
                        groupsSpace: 10,
                        barGroups: kGroup.map((e){
                          return BarChartGroupData(x: e['t'], 
                          barRods:[
                            BarChartRodData(
                              y: double.parse(e['n'].toString()), 
                              width: 1.5, 
                              colors: [Colors.amber])
                            ]);
                          }).toList()
                        )),
                        SizedBox(height: 20,),
                      ],
                    )
                  : arrival_time != null && service_time != null && (1/service_time) > (1/arrival_time) && m != null && ti != null ?
                  Column(
                      children: [
                        Divider(color: Colors.black,),
                        result('ti is $ti', context, MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height * .15),
                        result('when   t < $ti   ⮕  n(t) \n = $m + [ 1/$arrival_time t] - [ 1/$service_time t]', context, MediaQuery.of(context).size.width * .7, MediaQuery.of(context).size.height * .15),
                        result('when \n  t >= $ti   ⮕  n(t) \n alternates between 0 and 1', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .2),
                        Divider(color: Colors.black,),
                        result(' when   n = 0   ⮕  wq(n) = ${((m-1) / (2*(1/service_time))).floor()}', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .15),
                        result(' when  \n n <= λ ti   ⮕  wq(n) \n = ( ${m-1} + n ) ($service_time) - n($arrival_time)', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .2),
                        result(' when  \n n > λ ti   ⮕  wq(n) = 0', context, MediaQuery.of(context).size.width * .95, MediaQuery.of(context).size.height * .2),
                        BarChart(BarChartData(
                          axisTitleData: FlAxisTitleData(
                            bottomTitle: AxisTitle(
                              showTitle: true,
                              titleText: 'Time',
                              textAlign: TextAlign.center
                            ),
                            leftTitle: AxisTitle(
                              showTitle: true,
                              titleText: 'n(t)',
                              textAlign: TextAlign.center
                            ),
                          ),
                          borderData: FlBorderData(
                          border: Border(
                            top: BorderSide.none,
                            right: BorderSide.none,
                            left: BorderSide(width: 1),
                            bottom: BorderSide(width: 1),
                        )),
                        groupsSpace: 10,
                        barGroups: mGroup.map((e){
                          return BarChartGroupData(x: e['t'], 
                          barRods:[
                            BarChartRodData(
                              y: double.parse(e['n'].toString()), 
                              width: 1.5, 
                              colors: [Colors.amber])
                            ]);
                          }).toList()
                        )),
                        SizedBox(height: 20,),
                      ],
                    ) : SizedBox()
                ],
              ),
            ),
          ),
        ),
    );
  }
}