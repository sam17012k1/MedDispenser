import 'package:flutter/material.dart';
import 'package:alarms_app/pages/alarmsPage/alarmspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex=0;

  final screens=[
    const Center(child: Text("History",style: TextStyle(fontSize: 25)),),
    const Center(child: Text("Profile",style: TextStyle(fontSize: 25)),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Med Dispenser"),
      ),
      body: IndexedStack(
        index: currIndex,
        children: const [
          AlarmsPage(),
          Center(child: Text("History",style: TextStyle(fontSize: 25)),),
          Center(child: Text("Profile",style: TextStyle(fontSize: 25)),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index) => setState(() {
          currIndex=index;
        }),
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        elevation: 0,
        selectedFontSize: 11,
        selectedIconTheme: const IconThemeData(size: 28),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.alarm),label: 'Alarms'),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
