import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  String date = "";
  int temperature = 0;
  int humidity = 0;

  void getData() async {
    print('start getData');
    final url = Uri.parse('http://192.168.1.43:5001/showapp');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body);
      // var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: ${jsonResponse[0][0][0]}.');
      print('Number of books about http: ${jsonResponse[1][0][0]}.');
      print('Number of books about http: ${jsonResponse[2][0][0]}.');

      temperature = int.parse(jsonResponse[0][0][0].toString());
      humidity = int.parse(jsonResponse[1][0][0].toString());
      date = jsonResponse[2][0][0].toString();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            width: constraints.maxWidth - 10,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text('일시'),
                const SizedBox(height: 10,),
                Text(date, style: const TextStyle(fontSize: 20, color: Colors.green),),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                width: constraints.maxWidth / 2 - 10,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 5,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('온도'),
                    const SizedBox(height: 10,),
                    Text('$temperature', style: const TextStyle(fontSize: 30, color: Colors.red),),
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
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('습도'),
                    const SizedBox(height: 10,),
                    Text('$humidity', style: const TextStyle(fontSize: 30, color: Colors.blue),),
                  ],
                ),
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                print('refresh click');
                getData();
              },
              child: const Text('새로고침')),
        ],
      );
    });
  }
}
