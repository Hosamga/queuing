import 'package:flutter/material.dart';
import 'package:queues/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: '/home',
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   final GlobalKey<FormState> key = GlobalKey<FormState>();

//   String _selected_arrival = 'M';

//   String _selected_service = 'M';
  
//   String _selected_number_of_servers = '1';

//   String _selected_system_capacity = '∞';

//   // First Model
//   double first_model_arrival_rate = 0;
//   double first_model_service_rate = 0;
//   bool firstModel = false;
//   bool firstModelAS = false;
//   int first_model_time;

//   int first_model_arrival_rate_top = 1;
//   int first_model_arrival_rate_bottom;

//   int first_model_service_rate_top = 1;
//   int first_model_service_rate_bottom;

//   int first_model_number;
//   String first_model_type = 'c';
//   bool arrivalMore = true;

//   int initial_customers;

//   first_model(type){

//     double arrival_rate = first_model_arrival_rate_top / first_model_arrival_rate_bottom;
//     double service_rate = first_model_service_rate_top / first_model_service_rate_bottom;
//     if(arrival_rate > service_rate){
//     if(type == 'c'){

//       int time = first_model_time;

//       int solve = (arrival_rate * time).floor() - (service_rate * time - (service_rate / arrival_rate)).floor();
//       print('customers $solve');
//       return solve;
//     }else if(type == 't'){
      

//       int customers = first_model_number;
//       int solve = ((customers - (service_rate / arrival_rate)) / (arrival_rate - service_rate)).floor();
//       print('solve $solve');
      
//       int t = 0;
//       int n = 0;
//       while(n != customers){
//         t++;
//         n = (arrival_rate * t).floor() - (service_rate * t - (service_rate / arrival_rate)).floor();
//       }
//       print('t $t');
//       return t;
//       // print('customers $customers');

//       // int n = 0;
//       // int t = 0;
//       // while(n != customers){
//       //   t++;
//       //   n = (arrival_rate * t).floor() - (service_rate * t - (service_rate / arrival_rate)).floor();
//       // }
//       // print(((1/5)* 12) - ((1/3)/.2));
//       // print(12 * (1/3));
//       // print('solve $t');
//       // return t;
      
//     }
//     }
//   }

//   first_model_a_s(){
//     print(first_model_arrival_rate_top);
//     print(first_model_arrival_rate_bottom);
//     print(first_model_service_rate_top);
//     print(first_model_service_rate_bottom);
//     double arrival_rate = first_model_arrival_rate_top / first_model_arrival_rate_bottom;
//     double service_rate = first_model_service_rate_top / first_model_service_rate_bottom;

//     int customers = initial_customers;

//     int solve = (customers / (service_rate - arrival_rate)).floor();
//     print('solve $solve');
//     return solve;    
    
//   }

  
//   final GlobalKey<FormState> _first_model_key = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//           // child: Form(
//           //   key: key,
//           //   child: Column(
//           //     children: [
//           //       Row(
//           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //         children: [
//           //           Container(
//           //             width: MediaQuery.of(context).size.width * .4,
//           //             child: Column(
//           //               children: [
//           //                 Text('Arrival Pattern'),
//           //                 DropdownButton(
//           //                   value: _selected_arrival,
//           //                   items: <String>['M', 'D', 'Ek', 'G', 'GI'].map((e){
//           //                     return DropdownMenuItem(
//           //                       value: e,
//           //                       child: Text(e),
//           //                     );                       
//           //                   }).toList(),
//           //                   onChanged: (value) {
//           //                     setState(() {
//           //                       _selected_arrival = value;
//           //                     });
//           //                   },
//           //                 ),
//           //               ],
//           //             )
//           //           ),
//           //           Container(
//           //             width: MediaQuery.of(context).size.width * .4,
//           //             child: Column(
//           //               children: [
//           //                 Text('Service Pattern'),
//           //                 DropdownButton(
//           //                   value: _selected_service,
//           //                   items: <String>['M', 'D', 'Ek', 'G', 'GI'].map((e){
//           //                     return DropdownMenuItem(
//           //                       value: e,
//           //                       child: Text(e),
//           //                     );                       
//           //                   }).toList(),
//           //                   onChanged: (value) {
//           //                     setState(() {
//           //                       _selected_service = value;
//           //                     });
//           //                   },
//           //                 ),
//           //               ],
//           //             )
//           //           ),
//           //         ],
//           //       ),
//           //       Row(
//           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //         children: [
//           //           Container(
//           //             width: MediaQuery.of(context).size.width * .4,
//           //             child: Column(
//           //               children: [
//           //                 FittedBox(
//           //                   fit: BoxFit.fitWidth,
//           //                   child: Text('Number of Parallel Servers')
//           //                 ),
//           //                 DropdownButton(
//           //                   value: _selected_number_of_servers,
//           //                   items: <String>['1', 'k'].map((e){
//           //                     return DropdownMenuItem(
//           //                       value: e,
//           //                       child: Text(e),
//           //                     );                       
//           //                   }).toList(),
//           //                   onChanged: (value) {
//           //                     setState(() {
//           //                       _selected_number_of_servers = value;
//           //                     });
//           //                   },
//           //                 ),
//           //                 _selected_number_of_servers == 'k' ?
//           //                 TextFormField(

//           //                 )
//           //                 : SizedBox()
//           //               ],
//           //             )
//           //           ),
//           //           Container(
//           //             width: MediaQuery.of(context).size.width * .4,
//           //             child: Column(
//           //               children: [
//           //                 Text('System Capacity'),
//           //                 DropdownButton(
//           //                   value: _selected_system_capacity,
//           //                   items: <String>['∞', 'k'].map((e){
//           //                     return DropdownMenuItem(
//           //                       value: e,
//           //                       child: Text(e),
//           //                     );                       
//           //                   }).toList(),
//           //                   onChanged: (value) {
//           //                     setState(() {
//           //                       _selected_system_capacity = value;
//           //                     });
//           //                   },
//           //                 ),
//           //                 _selected_system_capacity == 'k' ?
//           //                 TextFormField(

//           //                 )
//           //                 : SizedBox()
//           //               ],
//           //             )
//           //           ),
//           //         ],
//           //       ),
//           //       Padding(
//           //         padding: const EdgeInsets.only(top: 18.0),
//           //         child: Row(
//           //           mainAxisAlignment: MainAxisAlignment.center,
//           //           children: [
//           //             Container(
//           //               width: MediaQuery.of(context).size.width * .4,
//           //               child: Column(
//           //                 children: [
//           //                   Text('Queueing discipline'),
//           //                   DropdownButton(
//           //                     value: 'FCFS',
//           //                     items: <String>['FCFS'].map((e){
//           //                       return DropdownMenuItem(
//           //                         value: e,
//           //                         child: Text(e),
//           //                       );                       
//           //                     }).toList(),
//           //                     onChanged: (value) {
                                
//           //                     },
//           //                   ),
//           //                 ],
//           //               )
//           //             ),
//           //           ],
//           //         ),
//           //       ),

//           //       Divider(color: Colors.black,),
//           //       _selected_number_of_servers == '1' && _selected_system_capacity == '∞' ?
//           //        Form(
//           //          key: _first_model_key,
//           //         child: Column(
//           //           children: [
//           //                 Row(
//           //                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //                   children: [
//           //                     Column(
//           //                       crossAxisAlignment: CrossAxisAlignment.center,
//           //                       mainAxisAlignment: MainAxisAlignment.center,
//           //                       children: [
//           //                         Container(
//           //                           width: MediaQuery.of(context).size.width * .4,
//           //                           child: Text('Arrvial Rate')),
//           //                         SizedBox(height: 20,),
//           //                         Container(
//           //                           width: MediaQuery.of(context).size.width * .4,
//           //                           child: Row(
//           //                             children: [
//           //                               SizedBox(
//           //                                 width: 20,
//           //                                 height: 30,
//           //                                 child: FocusScope(
//           //                                   canRequestFocus: false,
//           //                                   node: FocusScopeNode(canRequestFocus: false),
//           //                                   child: TextFormField(
//           //                                     initialValue: '1',
//           //                                     keyboardType: TextInputType.number,
//           //                                     decoration: InputDecoration(
//           //                                     ),
                                              
//           //                                   ),
//           //                                 ),
//           //                               ),
//           //                               Text('/ '),
//           //                               SizedBox(
//           //                                 width: 20,
//           //                                 height: 30,
//           //                                 child: TextFormField(
//           //                                   keyboardType: TextInputType.number,
//           //                                   decoration: InputDecoration(
//           //                                   ),
                                            
//           //                                   validator: (value) {
//           //                                     if(value.isEmpty){
//           //                                       return 'Please Type Arrival Rate';
//           //                                     }
//           //                                     if(int.tryParse(value) == null){
//           //                                       return 'Please Type a valid number';
//           //                                     }
//           //                                   },
//           //                                   onChanged: (value) {
//           //                                     setState(() {
//           //                                       firstModel = false;
//           //                                       firstModelAS = false;
//           //                                       first_model_arrival_rate_bottom = int.parse(value);
//           //                                     });
                                              
//           //                                   },
//           //                                   onSaved: (newValue) {
//           //                                     first_model_arrival_rate_bottom = int.parse(newValue);
//           //                                   },
//           //                                 ),
//           //                               ),
//           //                             ],
//           //                           ),
//           //                         ),
//           //                       ],
//           //                     ),
//           //                     Column(
//           //                       mainAxisAlignment: MainAxisAlignment.center,
//           //                       children: [
//           //                         Container(
//           //                           width: MediaQuery.of(context).size.width * .4,
//           //                           child: Text('Service Rate')),
//           //                         SizedBox(height: 20,),
//           //                         Container(
//           //                           width: MediaQuery.of(context).size.width * .4,
//           //                           child: Row(
//           //                             children: [
//           //                               SizedBox(
//           //                                 width: 20,
//           //                                 height: 30,
//           //                                 child: FocusScope(
//           //                                   canRequestFocus: false,
//           //                                   node: FocusScopeNode(canRequestFocus: false),
//           //                                   child: TextFormField(
//           //                                     initialValue: '1',
//           //                                     keyboardType: TextInputType.number,
//           //                                     decoration: InputDecoration(
//           //                                     ),
                                              
//           //                                   ),
//           //                                 ),
//           //                               ),
//           //                               Text('/ '),
//           //                               SizedBox(
//           //                                 width: 20,
//           //                                 height: 30,
//           //                                 child: TextFormField(
//           //                                   keyboardType: TextInputType.number,
//           //                                   decoration: InputDecoration(
//           //                                   ),
                                            
//           //                                   validator: (value) {
//           //                                     if(value.isEmpty){
//           //                                       return 'Please Type Service Rate';
//           //                                     }
//           //                                     if(int.tryParse(value) == null){
//           //                                       return 'Please Type a valid number';
//           //                                     }
//           //                                   },
//           //                                   onChanged: (value) {
//           //                                     setState(() {
//           //                                       firstModel = false;
//           //                                       firstModelAS = false;
//           //                                       first_model_service_rate_bottom = int.parse(value);
//           //                                     });
//           //                                   },
//           //                                   onSaved: (newValue) {
//           //                                     first_model_service_rate_bottom = int.parse(newValue);
//           //                                   },
//           //                                 ),
//           //                               ),
//           //                             ],
//           //                           ),
//           //                         ),
//           //                       ],
//           //                     ),
//           //                   ],
//           //       ),
//           //       SizedBox(height: 30,),
//           //       first_model_service_rate_top != null && first_model_service_rate_bottom != null && first_model_service_rate_top != null 
//           //       && first_model_service_rate_bottom != null && first_model_arrival_rate_top / first_model_arrival_rate_bottom 
//           //       > first_model_service_rate_top / first_model_service_rate_bottom ?
//           //       Container(
//           //             width: MediaQuery.of(context).size.width * .9,
//           //             child: Column(
//           //               children: [
//           //                 FittedBox(
//           //                   fit: BoxFit.fitWidth,
//           //                   child: Text(
//           //                     'What do you want to calculate',
//           //                     style: TextStyle(
//           //                       fontSize: 18
//           //                     ),
//           //                   )
//           //                 ),
//           //                 DropdownButton(
//           //                   value: first_model_type == 'c' ? 'number of customers at time' : 'time when certain number of customers' ,
//           //                   items: <String>['number of customers at time', 'time when certain number of customers'].map((e){
//           //                     return DropdownMenuItem(
//           //                       value: e,
//           //                       child: Text(e),
//           //                     );                       
//           //                   }).toList(),
//           //                   onChanged: (value) {
//           //                     setState(() {
//           //                       firstModel = false;
//           //                     });
//           //                     if(value == 'number of customers at time'){
//           //                       setState(() {
//           //                         first_model_type = 'c';
//           //                       });
//           //                     }else{
//           //                       setState(() {
//           //                         first_model_type = 't';
//           //                       });
//           //                     }
//           //                   },
//           //                 ),
//           //                 _selected_number_of_servers == 'k' ?
//           //                 TextFormField(

//           //                 )
//           //                 : SizedBox()
//           //               ],
//           //             )
//           //           ) : 
//           //           first_model_service_rate_top != null && first_model_service_rate_bottom != null && first_model_service_rate_top != null 
//           //       && first_model_service_rate_bottom != null && first_model_arrival_rate_top / first_model_arrival_rate_bottom 
//           //       > first_model_service_rate_top / first_model_service_rate_bottom ?
//           //           TextFormField(
//           //             decoration: InputDecoration(
//           //               labelText: 'Initial Value of Customers'
//           //             ),
//           //             validator: (value) {
//           //               if(value.length < 1){
//           //                 return 'Please Type Initial Value of Customers';
//           //               }
//           //               if(int.tryParse(value) == null){
//           //                 return 'Please Type a valid number';
//           //               }
//           //             },
//           //             onSaved: (newValue) {
//           //               initial_customers = int.parse(newValue);
//           //             },
//           //           ) : SizedBox(),
//           //           first_model_service_rate_top != null && first_model_service_rate_bottom != null && first_model_service_rate_top != null 
//           //       && first_model_service_rate_bottom != null && first_model_arrival_rate_top / first_model_arrival_rate_bottom 
//           //       < first_model_service_rate_top / first_model_service_rate_bottom && first_model_type == 'c' ?
//           //                 Container(
//           //                   width: MediaQuery.of(context).size.width * .4,
//           //                   child: TextFormField(
//           //                     keyboardType: TextInputType.number,
//           //                     decoration: InputDecoration(
//           //                       labelText: 'Time',
//           //                       hintText: 'Ex: 2'
//           //                     ),
//           //                     validator: (value) {
//           //                       if(value.isEmpty){
//           //                         return 'Please Type Time';
//           //                       }
//           //                       if(int.tryParse(value) == null){
//           //                         return 'Please Type a valid number';
//           //                       }
//           //                     },
//           //                     onSaved: (newValue) {
//           //                       first_model_time = int.parse(newValue);
//           //                     },
//           //                   ),
//           //                 ) :
//           //                 first_model_service_rate_top != null && first_model_service_rate_bottom != null && first_model_service_rate_top != null 
//           //       && first_model_service_rate_bottom != null && first_model_arrival_rate_top / first_model_arrival_rate_bottom 
//           //       > first_model_service_rate_top / first_model_service_rate_bottom && first_model_type == 't' ?
//           //                 Container(
//           //                   width: MediaQuery.of(context).size.width * .4,
//           //                   child: TextFormField(
//           //                     keyboardType: TextInputType.numberWithOptions(decimal: true),
//           //                     decoration: InputDecoration(
//           //                       labelText: 'Num of Customers',
//           //                       hintText: 'Ex: 5'
//           //                     ),
//           //                     validator: (value) {
//           //                       if(value.isEmpty){
//           //                         return 'Please Type Num of Customers';
//           //                       }
//           //                       if(int.tryParse(value) == null){
//           //                         return 'Please Type a valid number';
//           //                       }
//           //                       if(value.length > 10000){
//           //                         return 'Please Type a small number';
//           //                       }
//           //                     },
//           //                     onSaved: (newValue) {
//           //                       first_model_number = int.parse(newValue);
//           //                     },
//           //                   ),
//           //                 ) : SizedBox()
//           //           ],
//           //         ),
//           //        )  : SizedBox(),
//           //       SizedBox(height: MediaQuery.of(context).size.height * .05,),
//           //       SizedBox(
//           //         width: MediaQuery.of(context).size.width * .8,
//           //         child: RaisedButton(
//           //           shape: RoundedRectangleBorder(
//           //             borderRadius: BorderRadius.all(Radius.circular(8)),
//           //           ),
//           //           color: Color.fromRGBO(8, 4, 92, 1),
//           //           child: Text(
//           //             'Calculate',
//           //             style: TextStyle(
//           //               color: Colors.white
//           //             ),
//           //           ),
//           //           onPressed: () {
//           //             if(!_first_model_key.currentState.validate()){
//           //               return;
//           //             }
//           //             _first_model_key.currentState.save();
//           //             print(first_model_arrival_rate_top);
//           //             print(first_model_arrival_rate_bottom);
//           //             print(first_model_service_rate_top);
//           //             print(first_model_service_rate_bottom);
//           //             int sol = (4 / ((1/3) - (1/5))).floor();
//           //             print('sol $sol');
//           //             if(
//           //             first_model_service_rate_top != null && first_model_service_rate_bottom != null && first_model_service_rate_top != null 
//           //             && first_model_service_rate_bottom != null && first_model_arrival_rate_top / first_model_arrival_rate_bottom 
//           //             > first_model_service_rate_top / first_model_service_rate_bottom ){
//           //             setState(() {
//           //               firstModel = true;
//           //               firstModelAS = false;
//           //             });
//           //             }else{
//           //               setState((){
//           //                 firstModelAS = true;
//           //                 firstModel = false;
//           //               });
//           //               first_model_a_s();
//           //             }
//           //           },
//           //         ),
//           //       ),
//           //       SizedBox(height: 20,),
//           //       firstModel ? 
//           //       Container(
//           //         height: 100,
//           //         child: Card(
//           //           shape: RoundedRectangleBorder(
//           //             borderRadius: BorderRadius.all(Radius.circular(10)),
//           //             side: BorderSide(color: Colors.black, width: 1)
//           //           ),
//           //           elevation: 5,
//           //           child: Padding(
//           //             padding: const EdgeInsets.all(8.0),
//           //             child: Column(
//           //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //               children: [
//           //                 Text('${first_model_type == 'c' ? 'The number of Customers at time $first_model_time' : "The time when number of customers is $first_model_number"}'),
//           //                 SizedBox(height: 10),
//           //                 Text('${first_model(first_model_type)}')
//           //               ],
//           //             ),
//           //           ),
//           //         ),
//           //       ) : firstModelAS ? 
//           //         Container(
//           //         height: 100,
//           //         child: Card(
//           //           shape: RoundedRectangleBorder(
//           //             borderRadius: BorderRadius.all(Radius.circular(10)),
//           //             side: BorderSide(color: Colors.black, width: 1)
//           //           ),
//           //           elevation: 5,
//           //           child: Padding(
//           //             padding: const EdgeInsets.all(8.0),
//           //             child: Column(
//           //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //               children: [
//           //                 Text('"The time when number of customers is 0"'),
//           //                 SizedBox(height: 10),
//           //                 Text('${first_model_a_s()}')
//           //               ],
//           //             ),
//           //           ),
//           //         ),
//           //       )
//           //       : SizedBox()
//           //     ],
//           //   ),
//           // ),
//     );
//   }
// }
