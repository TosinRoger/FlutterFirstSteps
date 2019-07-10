import 'package:flutter/material.dart';

void main() => runApp(FriendlyChatApp());

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendly Chat")),
    );
  }
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController =
      new TextEditingController(); //new

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: _buildTextComposer(),
    );
  }

  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          //new
          new Flexible(
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration:
                  new InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ), //new

          new Container(
            //new
            margin: new EdgeInsets.symmetric(horizontal: 4.0), //new
            child: new IconTheme(
              //new
              data: new IconThemeData(color: Theme.of(context).accentColor),
              child: new IconButton(
                  //new
                  icon: new Icon(Icons.send), //new
                  onPressed: () =>
                      _handleSubmitted(_textController.text)), //new
            ),
          ),
        ], //new
      ), //new
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}
