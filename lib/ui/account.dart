import 'package:assignment_app/ui/video.dart';
import 'package:assignment_app/utils/Dropdown.dart';
import 'package:assignment_app/utils/Steeper.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Account();
  }
}

class _Account extends State<Account> {
  String dropdownValue = 'One';

  List<String> spinnerItems = [
    'One',
    'Buy House',
    'Buy Car',
    'Start Own Business',
    'Other'
  ];
  List<String> spinnerItems1 = [
    'One1',
    '0 - 10,000',
    '11,000 - 50,000',
    '51,000 - 1,00,000',
    '> 1,00,000'
  ];
  List<String> spinnerItems2 = [
    'One2',
    'Upto 7,000',
    'Upto 20,000',
    'Upto 50,000',
    '> 51,000'
  ];

  @override
  Widget build(BuildContext context) {
    var _pageSize = MediaQuery.of(context).size.height;
    var _notifySize = MediaQuery.of(context).padding.top;
    //var _appBarSize = appBar.preferredSize.height;

    return Scaffold(
        backgroundColor: Color(0xFF3f7beb),
        body: SingleChildScrollView(
          child: Container(
            height: _pageSize - (_notifySize),
            child: Column(
              children: <Widget>[
                Steeper("two"),
                _buildLoginLayout(),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: ButtonTheme(
                    buttonColor: Color(0xFF5b8deb),
                    minWidth: double.infinity,
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Video()),
                        );
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildLoginLayout() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text.rich(
            TextSpan(
              text: 'Personal Information',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18), // default text style
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              "Please fill in the information below and your goal for digital saving",
              style: TextStyle(color: Color(0xFFa0c1ed), fontSize: 14)),
          SizedBox(
            height: 80,
          ),
          Dropdown(spinnerItems),
          SizedBox(
            height: 30,
          ),
          Dropdown(spinnerItems1),
          SizedBox(
            height: 30,
          ),
          Dropdown(spinnerItems2),
        ],
      ),
    );
  }
}
