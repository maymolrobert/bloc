import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/Strings/string.dart';
import 'package:watchlist_bloc/bloc/theme/theme_bloc.dart';
import 'package:watchlist_bloc/bloc/theme/theme_event.dart';
import 'contact_list.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  bool isSwitched = false;

  void toggleSwitch(ThemeBloc themeBloc, bool value) {
    if (isSwitched == false) {
      themeBloc.add(ChangeToggle(ThemeMode.dark));
      setState(() {
        isSwitched = true;
      });

    } else {
      themeBloc.add(ChangeToggle(ThemeMode.light));
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: Strings.contactTabs),
            title: const Text('Contacts'),
            actions: [
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  toggleSwitch(themeBloc, value);
                },
                activeColor: Colors.blue,
                inactiveThumbColor: Colors.redAccent,
              )
            ],
          ),
          body: const TabBarView(
            children: [
              ContactList(),
              ContactList(),
              ContactList(),
            ],
          ),
        ));
  }
}
