import 'package:flutter/material.dart';
import './historypage.dart';


class MedicineStatus extends StatelessWidget {
  final bool check ;
  final String day;
  const MedicineStatus({
    required this.check,
    required this.day,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: GestureDetector(
        onTap: (){
          Navigator.push( context,
            MaterialPageRoute(builder: (context) => HistoryScreen(day: day)),
          );
        },
        child: ListTile(
          leading: check == true ? 
          const CircleAvatar(
            backgroundColor: Colors.lightGreen,
            child: Icon(Icons.check, color: Colors.white,),
          ) 
            : const CircleAvatar(
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.priority_high, color: Colors.white,),
          ),
          title: Text(day),
        ),
      ),
    );
  }
}