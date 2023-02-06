import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/Strings/string.dart';
import 'package:watchlist_bloc/bloc/watchlist_bloc.dart';
import 'package:watchlist_bloc/bloc/watchlist_event.dart';
import 'package:watchlist_bloc/bloc/watchlist_state.dart';
import 'package:watchlist_bloc/model/data.dart';


class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  late Future<List<Data>> contactData;
  WatchlistBloc watchlistBloc=WatchlistBloc();

  @override
  void initState() {
    watchlistBloc.add(FetchContactData());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      watchlistBloc
      ,
      child: Scaffold(
        body: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state is ContactBlocLoading) {
              return  const Center(child: Text(Strings.loading));
            } else if (state is ContactFetchData) {
              List<Data> contactData = state.contacts;
              if (contactData == []) {
                return const Center(child: Text(Strings.loading));
              }
              else {
                return ListTileTheme(
                  contentPadding: const EdgeInsets.all(15),
                  textColor: Colors.black,
                  tileColor: Colors.white,
                  style: ListTileStyle.list,
                  dense: true,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 25.0),
                    itemCount: contactData.length,
                    itemBuilder: (_, index) =>
                        Card(
                          elevation: 1,
                          shadowColor: Colors.grey,
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(contactData[index].name,style: const TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(contactData[index].contacts),
                            trailing: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRne52y4l6A9gBy9SPuxPX-TsqQiXKIYMXgAsrnfjt6NPPlYdsU8N_AFIRpSWGbHGMM_L8&usqp=CAU"),
                          ),
                        ),
                  ),
                );
              }
            }
            else if (state is ContactError) {
              return const Center(child: Text(Strings.error));
            } else {
              return const Center(child: Text(Strings.error));
            }
          },),),);
  }
}