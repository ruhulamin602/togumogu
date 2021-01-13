import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _SwitchBoxProps { paddingLeft, color, text, rotation }

class CustomSwitch extends StatelessWidget {
  final bool switched;

  CustomSwitch({this.switched});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTween<_SwitchBoxProps>()
      ..add(_SwitchBoxProps.paddingLeft, 0.0.tweenTo(12.0), 1.seconds)
      ..add(_SwitchBoxProps.color, Color.fromRGBO(255, 65, 65, 1).tweenTo(Color.fromRGBO(255, 65, 65, 1)), 1.seconds)
      ..add(_SwitchBoxProps.text, ConstantTween("EN"), 500.milliseconds)
      ..add(_SwitchBoxProps.text, ConstantTween("BN"), 500.milliseconds)
      ..add(_SwitchBoxProps.rotation, (0.0).tweenTo(0.0), 1.seconds);

    return CustomAnimation<MultiTweenValues<_SwitchBoxProps>>(
      control: switched
          ? CustomAnimationControl.PLAY
          : CustomAnimationControl.PLAY_REVERSE,
      startPosition: switched ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildSwitchBox,
    );
  }

  Widget _buildSwitchBox(
      context, child, MultiTweenValues<_SwitchBoxProps> value) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: _outerBoxDecoration(value.get(_SwitchBoxProps.color)),
          width: 34,
          height: 19,
          padding: const EdgeInsets.all(0),
        ),
        Positioned(
          
            child: Padding(
          padding:
              EdgeInsets.only(left: value.get(_SwitchBoxProps.paddingLeft)),
          child: Container(
            decoration: _innerBoxDecoration(value.get(_SwitchBoxProps.color)),
            width: 22,
            height: 19,
            child: Transform.rotate(
              angle: value.get(_SwitchBoxProps.rotation),
              child: Center(
                  child:
                      Text(value.get(_SwitchBoxProps.text), style: labelStyle)),
            ),
          ),
        ))
      ],
    );
  }

  BoxDecoration _innerBoxDecoration(Color color) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25)), color: color,boxShadow: [BoxShadow(offset: Offset(0,3),blurRadius: 3,spreadRadius: 2,color: Colors.black.withOpacity(.3))]);

  BoxDecoration _outerBoxDecoration(Color color) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          width: 0,
          color: color,
        ),
      );

  static final labelStyle = TextStyle(
      height: 1.3,
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Colors.white);
}
