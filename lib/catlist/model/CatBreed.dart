import 'package:flutter_first_step_app/catlist/model/Breed.dart';

class CatBreed {
    var id = "";
    var url = "";
    var breeds = List<Bread>();

    CatBreed({this.id, this. url});

    factory CatBreed.fromJson(Map<String, dynamic> json) {
        return CatBreed(
            id: json['id'],
            url: json['url'],
//            breeds: json['breeds'],
        );
    }
}