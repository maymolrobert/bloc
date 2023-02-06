import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/bloc/theme/theme_event.dart';
import 'package:watchlist_bloc/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeMode>{
//  bool switchval;


  ThemeBloc( ) : super(ThemeMode.light) {
  on<ThemeEvent>((event, emit) {
  if (event is ChangeToggle) {
  emit(event.Theme);

  }
  });
  }
  }




