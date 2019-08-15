import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_first_step_app/catlist/model/CatBreed.dart';
import 'package:flutter_first_step_app/catlist/model/CatBreeList.dart';

class CatMain extends StatefulWidget {
  @override
  MyGetHttpDataState createState() => new MyGetHttpDataState();
}

class MyGetHttpDataState extends State<CatMain> {
  final String url = "https://api.thecatapi.com/v1/images/search?limit=10";
  List<CatBreed> breeds;

  // Function to get the JSON data
  Future<List<CatBreed>> getJSONData() async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull(url),
        // Only accept JSON response
        headers: {"Accept": "application/json"});

    // Logs the response body to the console
    print(response.body);

    if (response.statusCode == 200) {
      setState(() {
        // Get the JSON data
        var dataConvertedToJSON = json.decode(response.body);

        // Extract the required part and assign it to the global variable named data
        var a = CatBreedList.fromJson(dataConvertedToJSON);
        breeds = a.breeds;
      });
    } else {
      print("algo deu ruim");
    }

    // To modify the state of the app, use this method
    return breeds;
  }

  @override
  Widget build(BuildContext context) {

    Widget list;

    if (breeds == null) {
      list = emptyList();
    }
    else {
      list = new ListView.builder(
          itemCount: breeds.length,
          itemBuilder: (BuildContext context, int index) {
            return itemList(breeds[index]);
          });
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve JSON Data via HTTP GET"),
      ),
      // Create a Listview and load the data when available
      body: new Column(
        children: <Widget>[
          FlatButton.icon(
              onPressed: () {
                getJSONData();
              },
              icon: Icon(Icons.sync),
              label: Text("Request again")),
          new Expanded(
              child: list)
        ],
      ),
    );
  }

  Widget emptyList() {
    return Center(
      child: Text("Empty list"),
    );
  }

  Widget itemList(CatBreed catBreed) {
    Widget complement;

    if (catBreed.breeds.isEmpty) {
      complement = Text("Acho que iria ter informação?");
    } else {
      complement = Text(catBreed.breeds[0].name);
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
            catBreed.url,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          complement
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}
