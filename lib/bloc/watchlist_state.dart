
import 'package:watchlist_bloc/model/data.dart';

abstract class WatchlistState {


}

class WatchlistInitial extends WatchlistState {}


class ContactBlocLoading extends WatchlistState {}

class ContactFetchData extends WatchlistState {
  List<Data> contacts;
  ContactFetchData({required this.contacts});
}

class ContactError extends WatchlistState {
  String msg;
  ContactError({required this.msg});
}