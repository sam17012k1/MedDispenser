import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AlarmsScreen extends StatefulWidget {
  const AlarmsScreen({Key? key}) : super(key: key);

  @override
  _AlarmsScreenState createState() => _AlarmsScreenState();
}

class AlarmObject {
  late final String name;
  late final String time_in_hours;
  late final String time_in_minutes;

  AlarmObject(this.name, this.time_in_hours,this.time_in_minutes);
  AlarmObject.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        time_in_hours = json['hour'],
  time_in_minutes=json['minutes'];

}

class _AlarmsScreenState extends State<AlarmsScreen> {
  String alarmname = "";
  String alarmhour = "";
  String alarmminutes = "";

  void addAlarm(String name, String hour, String mins) {
    databaseReference
        .child(name)
        .set({'name': name, 'hour': hour, 'minutes': mins});
  }
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAnimatedList(
      //controller: _scrollController,
      query: databaseReference,
      itemBuilder: (context, snapshot, animation, index) {
        print(snapshot.value);
        final json = snapshot.value as Map<dynamic, dynamic>;
        final message = AlarmObject.fromJson(json);
        return AlarmWidget(name: message.name, minutes: message.time_in_minutes.toString(), hours: message.time_in_hours.toString(),);
      },
    ),
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          onPressed: () {

            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      //height: 50,
                      child: Wrap(
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                alarmname = value;
                              });
                            },
                            decoration:
                                InputDecoration(hintText: "Please Set a name"),
                          ),
                          Row(
                            children: [
                              Expanded(
                                //width: 45,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      alarmhour = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Time in hours"),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(

                                child: TextFormField(
                                keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      alarmminutes = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Time in minutes"),
                                ),
                              )
                            ],
                          ),
                          ElevatedButton(onPressed: () {
                            Navigator.of(context).pop();
                            addAlarm(alarmname, alarmhour, alarmminutes);
                          }, child: Text("SAVE"))
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Icon(
            Icons.add,
            size: 50,
          ),
        ),
      ),
    );
  }
}

bool isSwitched = false;

class AlarmWidget extends StatefulWidget {
  AlarmWidget( {Key? key, required this.hours, required this.minutes,required this.name})
      : super(key: key);
  String hours;
  String minutes;
  String name;

  @override
  _AlarmWidgetState createState() => _AlarmWidgetState(hours, minutes,name);
}

void deleteAlarm(String name){
  final databaseReference = FirebaseDatabase.instance.reference();
  databaseReference.child(name).remove();


}

class _AlarmWidgetState extends State<AlarmWidget> {
  bool isSwitched = false;
  String hours, minutes, name;

  _AlarmWidgetState(this.hours, this.minutes,this.name);
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        //textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        //textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,style: TextStyle(fontSize: 15),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      deleteAlarm(name);
                    },
                    child: Icon(
                      Icons.delete,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.hours + ":" + widget.minutes,
                  style: TextStyle(fontSize: 45),
                ),
                // SizedBox(
                //   width: 100,
                // ),
                Align(
                  alignment: Alignment.topRight,
                  child: Switch(
                    onChanged: toggleSwitch,
                    value: isSwitched,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.yellow,
                    inactiveThumbColor: Colors.redAccent,
                    inactiveTrackColor: Colors.orange,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
