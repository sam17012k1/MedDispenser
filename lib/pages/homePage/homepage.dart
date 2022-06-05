import 'package:flutter/material.dart';
import 'package:alarms_app/pages/alarmsPage/alarmspage.dart';
import 'package:alarms_app/pages/historyPage/historypage.dart';
import 'package:alarms_app/pages/historyPage/historylandingpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),

      // AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Med Dispenser"),
      ),

      // Body
      body: IndexedStack(
        index: currIndex,
        children: [
          const AlarmsPage(),
          const HistoryPage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.lock_outline, size: 32, 
                  color: Color(0xFF39A377),
                ),
                Text('Oops! Profiles are locked right now',
                  style: TextStyle(
                    color: Color(0xFF39A377),
                  ),
                )
              ],
            ),
          )
        ],
      ),

      // Bottom Navigation Bar
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
