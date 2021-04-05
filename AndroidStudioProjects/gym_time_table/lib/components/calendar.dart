import 'package:flutter/material.dart';
import 'package:gymtimetable/resources/constants.dart';
import 'package:gymtimetable/resources/util.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  List<DateTime> selectedDates = [DateTime.now()];
  List<TimeOfDay> selectedTimes = [TimeOfDay.now()];
  String loggedUserName = 'Jorge';

  void deleteAppointment(int index) {
    setState(() {
      selectedDates.removeAt(index);
      selectedTimes.removeAt(index);
    });
  }

  Text dateTimeToText(DateTime date, TimeOfDay time) {
    String formattedDate = convertDateToString(date);
    String formattedTime = convertTimeToString(time);

    return Text(
      '$formattedTime $formattedDate',
      style: kMainTextStyle,
    );
  }

  List<ListTile> getBookedSessionsTiles() {
    List<ListTile> tiles = [];

    for (int i = 0; i < selectedDates.length; i++) {
      tiles.add(
        ListTile(
          title: dateTimeToText(selectedDates[i], selectedTimes[i]),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: () {
              deleteAppointment(i);
            },
          ),
        ),
      );
    }

    return tiles;
  }

  bool hasAppointments() {
    return selectedDates.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Hi $loggedUserName !',
              style: kMainTextStyle,
            ),
            Text(
              hasAppointments()
                  ? kNoAppointmentsText
                  : kExistingAppointmentsText,
              style: kMainTextStyle,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(kPadding1),
                children: getBookedSessionsTiles(),
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.all(kPadding1),
              child: Text(
                'Book session',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blueGrey,
              onPressed: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 7)),
                  initialDate: selectedDate,
                  builder: (BuildContext context, Widget child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.blueGrey,
                        ),
                      ),
                      child: child,
                    );
                  },
                ).then((newDate) {
                  if (newDate != null) {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((newTime) {
                      if (newTime != null) {
                        setState(() {
                          selectedTime = newTime;
                        });

                        selectedDates.add(selectedDate);
                        selectedTimes.add(selectedTime);
                      }
                    });

                    setState(() {
                      selectedDate = newDate;
                    });
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
