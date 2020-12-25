import 'package:flutter/material.dart';
import 'package:queues/screens/home.dart';
import 'package:queues/screens/model1.dart';
import 'package:queues/screens/model2.dart';
import 'package:queues/screens/model3.dart';
import 'package:queues/screens/model4.dart';
import 'package:queues/screens/model5.dart';

Map<String , WidgetBuilder> routes = {
  '/home': (context) => Home(),
  '/model1': (context) => Model1(),
  '/model2': (context) => Model2(),
  '/model3': (context) => Model3(),
  '/model4': (context) => Model4(),
  '/model5': (context) => Model5()
};