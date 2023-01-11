import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class SensorPage extends StatelessWidget {

  void getdata(){
    final uri = Uri(
      scheme: 'http',
      host:'192.168.1.43',
      port: 5001,
      path: '/showapp',

  );
}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: constraints.maxWidth - 10,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('일시'),
                Text(),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                width: constraints.maxWidth / 2 - 10,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text('온도'),
                    Text(),
                  ],
                ),
              ),
              Container(
                width: constraints.maxWidth / 2,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text('습도'),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
