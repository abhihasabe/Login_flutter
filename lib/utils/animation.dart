import 'package:flutter/material.dart';

class Animations extends AnimatedWidget {
  final Tween<double> _SizeAnim = Tween<double>(begin: 500.0, end: 500.0);

  Animations({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animations = listenable;
    return Transform.scale(
      scale: animations.value,
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white30,
        child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(Icons.calendar_today)),
      ),
    );
  }
}
