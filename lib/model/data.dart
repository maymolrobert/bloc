class Data {

  final String id;
  final String name;
  final String contacts;
  final  String url;

  Data({required this.id, required this.name, required this.contacts,required this.url});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      name: json["name"],
      contacts: json["Contacts"],
      url: json["url"],
    );
  }
}