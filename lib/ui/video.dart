import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:assignment_app/utils/Steeper.dart';
import 'package:assignment_app/utils/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Video extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Video();
  }
}

class _Video extends State<Video> with TickerProviderStateMixin {
  String dropdownValue = 'One';
  List<String> monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Des"
  ];

  Duration initialtimer = new Duration();
  Animation<double> animation;
  AnimationController controller;
  TextEditingController _date = new TextEditingController();
  TextEditingController _time = new TextEditingController();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutCirc);

    animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      },
    );
    controller.forward();
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    var _pageSize = MediaQuery.of(context).size.height;
    var _notifySize = MediaQuery.of(context).padding.top;
    //var _appBarSize = appBar.preferredSize.height;
    controller.forward();
    return Scaffold(
        backgroundColor: Color(0xFF3f7beb),
        body: SingleChildScrollView(
          child: Container(
            height: _pageSize - (_notifySize),
            child: Column(
              children: <Widget>[
                Steeper("three"),
                _buildLoginLayout(),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: ButtonTheme(
                    buttonColor: Color(0xFF5b8deb),
                    minWidth: double.infinity,
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () {},
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
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Animations(animation: animation),
          ),
          Text.rich(
            TextSpan(
              text: 'Schedule Video Call',
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
              "Choose the date and time that you preferred. we will send a link via email to make a video call on the scheduled data and time.",
              style: TextStyle(color: Color(0xFFa0c1ed), fontSize: 14)),
          SizedBox(
            height: 50,
          ),
          TextField(
            onTap: () {
              Platform.isIOS ? CupertinoDateWidget() : _showDatePicker();
            },
            controller: _date,
            readOnly: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xFFf9f9f9),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFf9f9f9)),
                  borderRadius: BorderRadius.circular(6),
                ),
                suffixIcon: Icon(Icons.arrow_drop_down),
                hintText: '- Choose Date -',
                labelText: 'Date'),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            onTap: () {
              Platform.isIOS ? CupertinoTimeWidget() : _selectTime();
            },
            controller: _time,
            readOnly: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xFFf9f9f9),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFf9f9f9)),
                  borderRadius: BorderRadius.circular(6),
                ),
                suffixIcon: Icon(Icons.arrow_drop_down),
                hintText: '- Choose Time -',
                labelText: 'Time'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _showDatePicker() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2021));
    if (picked != null)
      setState(() => {
            selectedDate = picked,
            _date.value = TextEditingValue(
                text:
                    "${picked.day.toString().padLeft(2, '0')} ${monthNames[picked.month - 1]} ${picked.year.toString()}"),
            print("date_and_Time ${selectedDate}")
          });
  }

  _selectTime() async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _time.value = TextEditingValue(
            text: "${selectedTime.hour}:${selectedTime.minute}");
      });
    }
  }

  CupertinoDateWidget() async {
    CupertinoDatePicker(
        initialDateTime: new DateTime.now(),
        use24hFormat: false,
        minuteInterval: 1,
        onDateTimeChanged: (dateTime) {
          setState(() {
            _date.value = TextEditingValue(
                text:
                    "${dateTime.day.toString().padLeft(2, '0')} ${monthNames[dateTime.month]} ${dateTime.year.toString()}");
          });
        });
  }

  CupertinoTimeWidget() async {
    CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          _time.value = TextEditingValue(
              text: "${changedtimer.inHours}:${changedtimer.inMinutes}");
        });
      },
    );
  }
}
