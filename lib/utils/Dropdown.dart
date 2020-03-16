import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  Dropdown(this.spinnerItems);

  List<String> spinnerItems;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Dropdown(this.spinnerItems);
  }
}

class _Dropdown extends State {
  var dropdownSelectedItem;
  String newValue;
  List<String> spinnerItems;

  _Dropdown(List<String> spinnerItems) {
    this.spinnerItems = spinnerItems;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (spinnerItems[0] == "One") {
      spinnerItems[0] = "Goal For Activation";
    } else if (spinnerItems[0] == "One1") {
      spinnerItems[0] = "Monthly Income";
    } else if (spinnerItems[0] == "One2") {
      spinnerItems[0] = "Monthly Expense";
    }
    return buildDropdownButton();
  }

  Widget buildDropdownButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.white)),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            //value: spinnerItems[0],
            hint: Text(spinnerItems[0]),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 34,
            iconEnabledColor: Colors.black45,
            elevation: 16,
            style: TextStyle(color: Colors.white, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (String data) {
              newValue = data;
              setState(() {
                newValue;
              });
            },
            value: newValue,
            items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black87),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
