import 'package:flutter/material.dart';

Widget result(String result, context, width, height){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(18),
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                result,
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
  );
}