import 'package:flutter/material.dart';
import './widgets.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        children: const [
          MedicineStatus(check: true, day: 'Sun, 5 Jun',),
          MedicineStatus(check: false, day: 'Sat, 4 Jun',),
          MedicineStatus(check: true, day: 'Fri, 3 Jun',),
          MedicineStatus(check: true, day: 'Thu, 2 Jun',),
          MedicineStatus(check: false, day: 'Wed, 1 Jun',),
          MedicineStatus(check: true, day: 'Tue, 31 Mar',),
        ],
      ),
    );
  }
}
