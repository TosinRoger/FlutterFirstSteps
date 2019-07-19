import 'package:flutter_first_step_app/catlist/model/CatBreed.dart';

class CatBreedList {
  final List<CatBreed> breeds;

  CatBreedList({
    this.breeds,
  });

  factory CatBreedList.fromJson(List<dynamic> parseJson) {
    List<CatBreed> list = List<CatBreed>();
    return CatBreedList(
      breeds: list,
    );
  }
}

