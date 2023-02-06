import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/bloc/watchlist_event.dart';
import 'package:watchlist_bloc/bloc/watchlist_state.dart';
import 'package:watchlist_bloc/model/data.dart';
import 'package:watchlist_bloc/service/contact_service.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  ContactService contactRepo= ContactService();
  late List<Data> data;

  WatchlistBloc() : super(WatchlistInitial()) {
    on<WatchlistEvent>((event, emit) async {
      if (event is FetchContactData) {
        emit(ContactBlocLoading());
        try {
          data = await contactRepo.fetchData();

          emit(ContactFetchData(contacts: data));
        } catch (exception) {
          emit(ContactError(msg: exception.toString()));
        }
      }
    });
  }
}