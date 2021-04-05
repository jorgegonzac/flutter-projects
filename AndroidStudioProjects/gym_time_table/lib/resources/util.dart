import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String convertDateToString(DateTime date) {
  var formatter = new DateFormat('MMMMEEEEd');
  return formatter.format(date);
}

String convertTimeToString(TimeOfDay time) {
  String minutes = time.minute.toString();
  String hours = time.hour.toString();
  if (minutes.length == 1) {
    minutes = '0$minutes';
  }
  if (hours.length == 1) {
    hours = '0$hours';
  }
  return '$hours:$minutes';
}
