import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gymtimetable/models/appointment.dart';

class AppointmentModel extends ChangeNotifier {
  List<Appointment> _appointments = [];

  UnmodifiableListView<Appointment> get appointments =>
      UnmodifiableListView(_appointments);

  void remove(int index) {
    _appointments.removeAt(index);
    notifyListeners();
  }

  void add(DateTime date, TimeOfDay time) {
    _appointments.add(Appointment(date: date, time: time));
    notifyListeners();
  }

  Appointment get(int index) {
    return _appointments[index];
  }

  bool isEmpty() {
    return _appointments.isEmpty;
  }
}
