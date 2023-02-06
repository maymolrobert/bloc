import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/bloc/theme/theme_event.dart';
import 'package:watchlist_bloc/screen/TabScreen.dart';
import 'bloc/theme/theme_bloc.dart';

void main() => runApp(const MyApp());


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeBloc themeBloc=ThemeBloc();

  @override
  void initState() {
    themeBloc.add((ChangeToggle(ThemeMode.dark)));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc,ThemeMode>(
        builder: (context, state) {
    return MaterialApp(
      title: 'Contact List',

      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),

      themeMode:  state,
      debugShowCheckedModeBanner: false,
      home: const TabScreen(),
    );
  },),);
  }
}


