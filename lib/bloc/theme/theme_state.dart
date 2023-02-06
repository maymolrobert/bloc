import 'package:flutter/material.dart';

abstract class ThemeState {


}


class switchState extends ThemeState {


  bool switchVal;
  final ThemeMode theme;

  switchState( this.switchVal,this.theme);

}
class ThemeInitial extends ThemeState {}
