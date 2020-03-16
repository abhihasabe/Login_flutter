import 'package:flutter/material.dart';

import 'ClippingClass.dart';

class Steeper extends StatelessWidget {
  Steeper(this.data);

  String data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      child: Stack(children: <Widget>[
        Positioned(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ClipPath(
            clipper: ClippingClass(),
            child: Container(
              decoration: BoxDecoration(color: Color(0xFF3f7beb)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0, left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        data != ""
                            ? IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            : Container(),
                        data != ""
                            ? Text(
                                "Create Account",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  data == ""
                      ? Padding(
                          padding: const EdgeInsets.only(left: 35.0, top: 60.0),
                          child: callSteeper(),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 35.0, top: 20),
                          child: callSteeper(),
                        ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget callSteeper() {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 42.0,
              height: 42.0,
              child: Center(
                  child: Text("1",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              decoration: new BoxDecoration(
                color: data == "one" ? Color(0xFF81a462) : Colors.white,
                borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
                border: new Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
            Container(
                width: 50,
                child: Divider(
                  color: Colors.black,
                  thickness: 3,
                )),
            Container(
              width: 42.0,
              height: 42.0,
              child: Center(
                  child: Text("2",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              decoration: new BoxDecoration(
                color: data == "two" ? Color(0xFF81a462) : Color(0xFFf9f9f9),
                borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
                border: new Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
            Container(
                width: 50,
                child: Divider(
                  color: Colors.black,
                  thickness: 3,
                )),
            Container(
              width: 42.0,
              height: 42.0,
              child: Center(
                  child: Text("3",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              decoration: new BoxDecoration(
                color: data == "three" ? Color(0xFF81a462) : Color(0xFFf9f9f9),
                borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
                border: new Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
            Container(
                width: 50,
                child: Divider(
                  color: Colors.black,
                  thickness: 3,
                )),
          ],
        ),
        Row(
          children: <Widget>[
            Center(
              child: Container(
                width: 42.0,
                height: 42.0,
                child: Center(
                    child: Text("4",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
                decoration: new BoxDecoration(
                  color: data == "four" ? Color(0xFF81a462) : Color(0xFFf9f9f9),
                  borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
                  border: new Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
