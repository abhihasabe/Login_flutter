import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'Validators.dart';

class LoginBloc extends Object with Validators implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final PublishSubject _lodingData = PublishSubject<bool>();

  //Add data in Stream
  Function get emailChanged => _emailController.sink.add;
  Function get passwordChanged => _passwordController.sink.add;

  // retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Observable<bool> get loading =>_lodingData.stream;

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    if(validEmail!=null && validEmail.length>0){
      _lodingData.sink.add(true);
    }else{
      _lodingData.sink.add(false);
    }

    print('$validEmail and $validPassword');

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.close();
    _passwordController.close();

  }
}

abstract class BaseBloc {
  void dispose();
}