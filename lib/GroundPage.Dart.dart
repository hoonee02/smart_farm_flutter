import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroundPage extends StatelessWidget {
  const GroundPage({super.key});

  void giveSignal(int type, bool isOn) {
    if(type == 0 && isOn) { // LED on
      controlIotDevice("led/on");
    } else if(type == 0 && !isOn) { // LED off
      controlIotDevice("led/off");
    } else if(type == 1 && isOn) { // 서브모터 on
      controlIotDevice("servo_control?deg=0");
    } else if(type == 1 && !isOn) { // 서브모터 off
      controlIotDevice("servo_control?deg=105");
    } else if(type == 2 && isOn) { // fan on
      controlIotDevice("fan/on");
    } else if(type == 2 && !isOn) { // fan off
      controlIotDevice("fan/off");
    } else { // exception case
//
    }
  }

  controlIotDevice(String uri) async {
    final url = Uri.parse('http://192.168.1.43:5001/$uri');
    var response = await http.get(url);
    if (response.statusCode == 200) {
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
          width: double.maxFinite,
        ),
        const Text('LED 제어'),
        const SizedBox(
          height: 10,
          width: double.maxFinite,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                giveSignal(0, true);
              },
              child: const Text('LED ON'),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: () {
                giveSignal(0, false);
              },
              child: const Text('LED OFF'),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
          width: double.maxFinite,
        ),
        const Text('서브모터 제어'),
        const SizedBox(
          height: 10,
          width: double.maxFinite,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                giveSignal(1, true);
              },
              child: const Text('서브모터 ON'),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: () {
                giveSignal(1, false);
              },
              child: const Text('서브모터 OFF'),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
          width: double.maxFinite,
        ),
        const Text('Fan 제어'),
        const SizedBox(
          height: 10,
          width: double.maxFinite,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                giveSignal(2, true);
              },
              child: const Text('Fan ON'),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: () {
                giveSignal(2, false);
              },
              child: const Text('Fan OFF'),
            ),
          ],
        ),
      ],
    );
  }
}
