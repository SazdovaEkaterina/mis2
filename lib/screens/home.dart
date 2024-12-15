import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/joke_model.dart';
import '../services/api_service.dart';
import '../widgets/joke/joke_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    getJokeFromAPI();
  }

  void getJokeFromAPI() async {
    ApiService.getJokeFromJokeAPI().then((response) {
      var data = List.from(json.decode(response.body)["results"]);
      setState(() {
        jokes = data.asMap().entries.map<Joke>((element) {
          element.value['id'] = element.key + 1;
          element.value['img'] =
              "https://raw.githubusercontent.com/JokeAPI/sprites/master/sprites/joke/other/official-artwork/${element.key + 1}.png";
          return Joke.fromJson(element.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white, size: 24)),
        title: const Text("Joke App", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.white, size: 24))],
      ),
      body: JokeGrid(jokes: jokes),
    );
  }
}
