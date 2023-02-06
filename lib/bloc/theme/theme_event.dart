import 'package:flutter/material.dart';

abstract class ThemeEvent{}

class ChangeToggle extends ThemeEvent{
  final ThemeMode Theme;
  //bool switchtoggle ;
  ChangeToggle(this.Theme);




}

