import 'package:flutter/material.dart';
import './constants.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FractionallySizedBox(
        heightFactor: 0.8,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xFFE6E6E6))
          ),
          child: const Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.blueAccent,
              ),
              title: Text('Girjesh Singh'),
              subtitle: Text('22 | M'),
            ),
          ),
        ),
      ),
    );
  }
}


class Reminder extends StatelessWidget {
  final String dayTime, time, text ;
  const Reminder({
    required this.dayTime,
    required this.time,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(dayTime,style: kPrescriptionBoxTitle),
            const Spacer(),
            Text(time, style: kPrescriptionBoxTitle.copyWith(color: Colors.purpleAccent),)
          ],
        ),
        Text(text, style: kPrescriptionBoxSubtitle),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              SizedBox(
                width: 200,
                child: ListTile(
                  minLeadingWidth: 0,
                  leading: Icon(Icons.medication_rounded),
                  title: Text('Paracetamol'),
                  subtitle: Text('2'),
                ),
              ),
              SizedBox(
                width: 200,
                child: ListTile(
                  minLeadingWidth: 0,
                  leading: Icon(Icons.medication_rounded),
                  title: Text('Paracetamol'),
                  subtitle: Text('2'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}



class WeeklyData extends StatefulWidget {

  final int index ;
  final List day = [
    'MONDAY', 
    'TUESDAY', 
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY',
    'SUNDAY',
  ];

  WeeklyData({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<WeeklyData> createState() => _WeeklyDataState();
}

class _WeeklyDataState extends State<WeeklyData> {

  late int _index ;
  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.day[_index], style: kDayTextStyle,),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_left, size: 32,), 
                  onPressed: (){
                    setState(() {
                      _index = (_index-1)%7;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_right, size: 32,), 
                  onPressed: (){
                    setState(() {
                      _index = (_index+1)%7;
                    });
                  },
                ),
              ],
            )
          ],
        ),
        const Expanded(
          flex: 16,
          child: DayData(),
        ),
      ],
    );
  }
}

class DayData extends StatelessWidget {
  const DayData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: FractionallySizedBox(
        heightFactor: 0.95,
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xFFE6E6E6)),
          ),
          child: FractionallySizedBox(
            widthFactor: 0.95,
            heightFactor: 0.98,
            alignment: Alignment.bottomCenter,
            child: Column(
              children: const [
                Expanded(child: Reminder(dayTime: 'Morning', time: '8.30 AM', text: 'Take 2 pills after the breakfast',)),
                Expanded(child: Reminder(dayTime: 'Noon', time: '2.30 PM', text: 'Swallow the pill with warm water',)),
                Expanded(child: Reminder(dayTime: 'Evening', time: '9.30 PM', text: 'Take the tablet with milk',)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

