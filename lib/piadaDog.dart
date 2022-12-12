import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'joke.dart';

class PiadaDog extends StatefulWidget {
  const PiadaDog({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _piadaDogState createState() => _piadaDogState();
}

class _piadaDogState extends State<PiadaDog> {
  Future<List<Joke>> _getJokes() async {
    var data = await http
        .get(Uri.parse("https://api.chucknorris.io/jokes/search?query=dogs"));

    var jsonData = json.decode(data.body);

    List<Joke> jokes = [];

    for (var joke in jsonData["result"]) {
      Joke newJoke = Joke(joke["created_at"], joke["icon_url"], joke["id"],
          joke["url"], joke["value"]);
      jokes.add(newJoke);
    }

    return jokes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: _getJokes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Text("Carregando Piadas..."),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[index].iconUrl),
                    ),
                    title: Text(snapshot.data[index].createdAt),
                    subtitle: Text(snapshot.data[index].value),
                  );
                },
              );
            }
          },
        ));
  }
}
