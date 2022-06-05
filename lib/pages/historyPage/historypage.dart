import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {

  final String day ;
  const HistoryScreen({Key? key, required this.day}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}



class _HistoryScreenState extends State<HistoryScreen> {

  List<String> times= ["18:54","13:20","9:45"];
  List<String> medicines= ["Dolo 650", "Amphotecerin", "Cough Syrup"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('History'),
        centerTitle: true,
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Medicine(medicines: medicines, times: times, day: widget.day),
      ),
    );
  }
}

class Medicine extends StatelessWidget {
  final String day;
  const Medicine({
    required this.day,
    Key? key,
    required this.medicines,
    required this.times,
  }) : super(key: key);

  final List<String> medicines;
  final List<String> times;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(day, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        Expanded(
          child: ListView(
            children: [
              MedicineHistory(medicine: medicines[0], time: times[0]),
              MedicineHistory(medicine: medicines[1], time: times[1]),
              MedicineHistory(medicine: medicines[2], time: times[2])
            ],
          ),
        ),
        const SizedBox(height: 16.0,),
      ],
    );
  }
}




class MedicineHistory extends StatelessWidget {
  MedicineHistory({Key? key,required this.medicine,required this.time}) : super(key: key);
  late String time;
  late String medicine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF1F1F1)),
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListTile(
        leading: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/img.png"),
        ),
        title: Text(medicine),
        subtitle: const Text("Delay by 54m"),
      ),
    );
  }
}