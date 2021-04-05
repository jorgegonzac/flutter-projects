import 'package:flutter/material.dart';
import 'package:gymtimetable/resources/util.dart';
import 'package:gymtimetable/resources/constants.dart';

class Appointment {
  final DateTime date;
  final TimeOfDay time;

  Appointment({this.date, this.time});

  Text toHumanText() {
    String formattedDate = convertDateToString(date);
    String formattedTime = convertTimeToString(time);

    return Text(
      '$formattedTime $formattedDate',
      style: kMainTextStyle,
    );
  }
}
