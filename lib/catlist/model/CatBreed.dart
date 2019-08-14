import 'package:flutter_first_step_app/catlist/model/Breed.dart';

class CatBreed {
    var id = "";
    var url = "";
    final List<Bread> breeds;

    CatBreed({this.id, this. url, this.breeds});

    factory CatBreed.fromJson(Map<String, dynamic> json) {

        var parseJson = json[ 'breeds'] as List;
        print(parseJson.runtimeType);

        List<Bread> b = parseJson.map((i) => Bread.fromJson(i)).toList();

        return CatBreed(
            id: json['id'],
            url: json['url'],
            breeds: b,
        );
    }
}