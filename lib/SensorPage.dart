import 'package:flutter/material.dart';

class SensorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return Column(
        children: [
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