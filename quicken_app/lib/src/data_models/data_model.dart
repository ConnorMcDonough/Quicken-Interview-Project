class Data {
  final String date;
  final String description;
  final String name;
  final String url;

  Data({this.date, this.description, this.name, this.url});

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
        url: parsedJson['html_url'],
        date: parsedJson['updated_at'],
        description: parsedJson["description"],
        name: parsedJson["name"]);
  }
}
