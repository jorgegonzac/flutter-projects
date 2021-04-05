import 'package:flutter/material.dart';

class AppointmentTile extends StatelessWidget {
  final Text title;
  final Function handleIconOnPressed;

  AppointmentTile({
    this.title,
    this.handleIconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: IconButton(
        icon: Icon(Icons.delete),
        tooltip: 'Delete',
        onPressed: handleIconOnPressed,
      ),
    );
  }
}
