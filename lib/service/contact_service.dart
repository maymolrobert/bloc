import 'dart:convert';
import 'package:watchlist_bloc/Strings/string.dart';
import 'package:watchlist_bloc/model/data.dart';
import 'package:http/http.dart' as http;

class ContactService {
  Future<List<Data>> fetchData() async {
    var response = await http.get(
        Uri.parse(Strings.url));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) =>  Data.fromJson(data)).toList();
    } else {
      throw Exception(Strings.unexpectedError);
    }
  }
}