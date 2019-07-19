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
  List data;

  // Function to get the JSON data
  Future<List<CatBreed>> getJSONData() async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull(url),
        // Only accept JSON response
        headers: {"Accept": "application/json"});

    // Logs the response body to the console
    print(response.body);

    // https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
    // https://flutter.dev/docs/cookbook/networking/fetch-data

    if (response.statusCode == 200) {
      setState(() {
        // Get the JSON data
        var dataConvertedToJSON = json.decode(response.body);

        // Extract the required part and assign it to the global variable named data
//        data = dataConvertedToJSON['results'];
        var a = CatBreedList.fromJson(dataConvertedToJSON['results']);
        data = a.breeds;
      });
    }
    else {
      print("algo deu ruim");
    }

    // To modify the state of the app, use this method
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve JSON Data via HTTP GET"),
      ),
      // Create a Listview and load the data when available
      body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              child: new Center(
                  child: new Column(
                // Stretch the cards in horizontal axis
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(
                        // Read the name field value and set it in the Text widget
//                        data[index]['id'],
                      "Sei la",
                        // set some style to text
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.lightBlueAccent),
                      ),
                      // added padding
                      padding: const EdgeInsets.all(15.0),
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}
