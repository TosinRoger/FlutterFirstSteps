
class Bread {
  var id = "";
  var url = "";
  var name = "";
  var origin = "";
  var altName = "";
  var lifeSpan = "";
  var temperament = "";

  Bread({
    this.id,
    this. url,
    this.name,
    this.origin,
    this.altName,
    this.lifeSpan,
    this.temperament,
  });

  factory Bread.fromJson(Map<String, dynamic> json) {

    return Bread(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      origin: json['origin'],
      altName: json['altName'],
      temperament: json['temperament'],
    );
  }
}