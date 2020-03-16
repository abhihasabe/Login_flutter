import 'package:assignment_app/blocs/loginbloc.dart';
import 'package:flutter/material.dart';
import '../utils/Steeper.dart';
import 'Password.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<Login> {
  var bloc = LoginBloc();
  final _userNametext = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _pageSize = MediaQuery.of(context).size.height;
    var _notifySize = MediaQuery.of(context).padding.top;
    //var _appBarSize = appBar.preferredSize.height;

    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            height: _pageSize - (_notifySize),
            child: Column(
              children: <Widget>[
                Steeper(""),
                _buildLoginLayout(),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: ButtonTheme(
                    buttonColor: Color(0xFF3f7beb),
                    minWidth: double.infinity,
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () {
                        _userNametext.text.isEmpty ? callToast() : call();
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
              text: 'Welcome to \nGIN ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32), // default text style
              children: <TextSpan>[
                TextSpan(
                    text: 'Finans',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF3f7beb))),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "Welcome to the Bank of The Future.\nManage and track your accounts on the go.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(
            height: 50,
          ),
          Card(
              margin: EdgeInsets.all(3),
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<Object>(
                    stream: bloc.email,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _userNametext,
                        onChanged: bloc.emailChanged,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFf9f9f9),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf9f9f9)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            errorText: snapshot.error),
                      );
                    }),
              )),
        ],
      ),
    );
  }

  call() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Password()),
    );
  }

  callToast() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Please Enter Email Id"),
    ));
  }
}
