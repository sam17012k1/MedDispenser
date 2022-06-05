import 'package:alarms_app/alarms_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex=0;

  final screens=[
    AlarmsScreen(),
    Center(child: Text("History",style: TextStyle(fontSize: 25)),),
    Center(child: Text("Profile",style: TextStyle(fontSize: 25)),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Med Dispenser"),
      ),
      body: screens[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index) => setState(() {
          currIndex=index;
        }),
        iconSize: 25,
        selectedFontSize: 16,
        unselectedFontSize: 10,
        showUnselectedLabels: false,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.alarm),label: 'Alarms'),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
