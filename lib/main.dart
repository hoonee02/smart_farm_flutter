import 'package:flutter/material.dart';
import 'package:farm/SensorPage.dart';
import 'package:farm/loginpage.dart';
import 'package:farm/GroundPage.Dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onnavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedPage;
    switch (_selectedIndex) {
      case 0:
        selectedPage = SensorPage();
        break;
      case 1:
        selectedPage = EnvironmentPage();
        break;
      case 2:
        selectedPage = GroundPage();
        break;
      case 3:
        selectedPage = CCTVPage();
        break;
      default:
        selectedPage = Container();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Farm Application'),
        backgroundColor: Colors.lightGreen,
      ),
      body: selectedPage,
      // PageView(
      //   children: [
      //     SensorPage(),
      //     EnvironmentPage(),
      //     GroundPage(),
      //     CCTVPage(),
      //   ],
      //   onPageChanged: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.lightGreen),
            label: 'Sensor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thermostat,color: Colors.lightGreen),
            label: 'Environment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.query_stats,color: Colors.lightGreen),
            label: 'Ground',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.screenshot,color: Colors.lightGreen),
            label: 'CCTV',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index){
          _onnavTapped(index);
        },
      ),
    );
  }
}

class EnvironmentPage extends StatelessWidget {
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
              ),
            ],
          ),
        ],
      );
    });
  }
}

class CCTVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('This is the CCTVPage'),
    );
  }
}
