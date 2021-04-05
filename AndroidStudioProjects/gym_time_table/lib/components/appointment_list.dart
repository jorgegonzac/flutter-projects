import 'package:flutter/material.dart';
import 'package:gymtimetable/components/appointment_tile.dart';
import 'package:gymtimetable/models/appointment.dart';
import 'package:gymtimetable/models/appointment_model.dart';
import 'package:provider/provider.dart';

class AppointmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentModel>(
      builder: (context, appointmentData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final Appointment appointment = appointmentData.get(index);
            return AppointmentTile(
              title: appointment.toHumanText(),
              handleIconOnPressed: () {
                appointmentData.remove(index);
              },
            );
          },
        );
      },
    );
  }
}
