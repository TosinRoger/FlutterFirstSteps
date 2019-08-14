
class Bread {
  var id = "";
  var url = "";
  var name = "";

  Bread({
    this.id,
    this. url,
    this.name
  });

  factory Bread.fromJson(Map<String, dynamic> json) {

    return Bread(
      id: json['id'],
      url: json['url'],
      name: json['name'],
    );
  }
}