import 'package:alarms_app/pages/alarmsPage/constants.dart';
import 'package:flutter/material.dart';
import './widgets.dart';

class AlarmsPage extends StatefulWidget {
  const AlarmsPage({Key? key}) : super(key: key);

  @override
  State<AlarmsPage> createState() => _AlarmsPageState();
}

class _AlarmsPageState extends State<AlarmsPage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.98,
        widthFactor: 0.9,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  WeeklyData(index: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
