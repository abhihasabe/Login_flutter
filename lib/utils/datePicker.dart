import 'package:flutter/material.dart';

class SatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: _showDatePicker(),
    );
  }

  _showDatePicker() async {
    DateTime picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2021));
    if (picked != null) {
      print(picked);
    }
  }
}
