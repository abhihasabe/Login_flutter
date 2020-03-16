import 'package:assignment_app/blocs/loginbloc.dart';
import 'package:assignment_app/utils/SnackBar.dart';
import 'package:assignment_app/utils/Steeper.dart';
import 'package:flutter/material.dart';

import 'account.dart';

class Password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Password();
  }
}

class _Password extends State<Password> {
  TextEditingController passwordController = new TextEditingController();
  var bloc = LoginBloc();
  bool _obscureText = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _pageSize = MediaQuery.of(context).size.height;
    var _notifySize = MediaQuery.of(context).padding.top;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFF3f7beb),
        body: SingleChildScrollView(
          child: Container(
            height: _pageSize - (_notifySize),
            child: Column(
              children: <Widget>[
                Steeper("one"),
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
                        passwordController.text.isEmpty
                            ? callToast("Please Enter Password")
                            : passwordController.text.length < 9
                                ? callToast(
                                    "Please Enter More than 8 charter Password")
                                : passwordController.text ==
                                        passwordController.text.toUpperCase()
                                    ? callToast("Please Enter Valid Password")
                                    : passwordController.text ==
                                            passwordController.text
                                                .toLowerCase()
                                        ? callToast(
                                            "Please Enter Valid Password")
                                        : !RegExp('[0-9]').hasMatch(
                                                passwordController.text)
                                            ? callToast(
                                                "Please Enter Valid Password")
                                            : call();
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
              text: 'Create Password',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18), // default text style
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Password will be used to login to account",
              style: TextStyle(color: Color(0xFFa0c1ed), fontSize: 14)),
          SizedBox(
            height: 80,
          ),
          StreamBuilder<Object>(
              stream: bloc.password,
              builder: (context, snapshot) {
                return TextField(
                  controller: passwordController,
                  onChanged: bloc.passwordChanged,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFf9f9f9),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFf9f9f9)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          semanticLabel:
                              _obscureText ? 'show password' : 'hide password',
                        ),
                      ),
                      labelText: 'Create Password',
                      errorText: snapshot.error),
                  obscureText: _obscureText,
                );
              }),
          SizedBox(
            height: 30,
          ),
          Text("Complecity",
              style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    passwordController.text ==
                            passwordController.text.toUpperCase()
                        ? Center(
                            child: Text(
                              "a",
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xFFa0c1ed)),
                            ),
                          )
                        : Container(
                            child: CircleAvatar(
                              radius: 15,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "LowerCase",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFa0c1ed)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: <Widget>[
                    passwordController.text ==
                            passwordController.text.toLowerCase()
                        ? Center(
                            child: Text(
                              "A",
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xFFa0c1ed)),
                            ),
                          )
                        : Container(
                            child: CircleAvatar(
                              radius: 15,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "UpperCase",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFa0c1ed)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: <Widget>[
                    RegExp('[0-9]').hasMatch(passwordController.text)
                        ? Container(
                            child: CircleAvatar(
                              radius: 15,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              "123",
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xFFa0c1ed)),
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Number",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFa0c1ed)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: <Widget>[
                    passwordController.text.length < 9
                        ? Center(
                            child: Text(
                              "9+",
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xFFa0c1ed)),
                            ),
                          )
                        : Container(
                            child: CircleAvatar(
                              radius: 15,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Characters",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFa0c1ed)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  callToast(String name) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(name),
    ));
  }

  call() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Account()),
    );
  }
}
