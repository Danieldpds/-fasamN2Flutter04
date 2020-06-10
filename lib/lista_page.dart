import 'dart:convert';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          child: new Center(
        child: new FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('assets/photos.json'),
            builder: (context, snapshot) {
              var photos = json.decode(snapshot.data.toString());

              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var photo = photos[index];
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Title: " + photo['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23)),
                        new Image.network(photo['url'], height: 200),
                        new Image.network(photo['thumbnailUrl'], height: 200)
                      ],
                    ),
                  );
                },
                itemCount: photos == null ? 0 : photos.length,
              );
            }),
      )),
    );
  }
}
