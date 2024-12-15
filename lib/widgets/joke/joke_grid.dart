import 'package:flutter/material.dart';
import 'package:new_flutter_project/models/joke_model.dart';
import 'package:new_flutter_project/widgets/joke/joke_card.dart';

class JokeGrid extends StatefulWidget {
  final List<Joke> jokes;
  const JokeGrid({super.key, required this.jokes});

  @override
  State<JokeGrid> createState() => _JokeGridState();
}

class _JokeGridState extends State<JokeGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(padding: const EdgeInsets.all(4),
        crossAxisCount: 2,
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
    semanticChildCount: 250,
    childAspectRatio: 200/ 244,
    shrinkWrap: true,
      children: widget.jokes.map((joke) => JokeCard(
        id: joke.id, name: joke.name, image: joke.image,
      )).toList()
    );
  }
}
