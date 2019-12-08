// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // use the english words package to generate the text

void main() =>
    runApp(MyApp()); // => arrow notation for one-line functions or methods

class MyApp extends StatelessWidget {
  // class extends StateLessWidget which makes the app itself. Almost everything (alignment, padding, layout) is a widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // creates a Material app
      title: 'Startup Name Generator',
      home: RandomWords(),
        //Scaffold widget gives a default app bar, title and a body property that holds the tree widget for the home screen
    );
  }
}

// Add a stateful widget, RandomWords, which creates its state class, RandomWordsState.
// use RandomWords as a child in the existing MyApp stateless widget
class RandomWordsState extends State<RandomWords> {
  // This class saves the generated word pairs which grows infinitely as the user scrolls, and favourite word pairs, as the user
  // adds or removes them from the list by toggling the heart icon.
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  // This class simply creats its State class
  @override
  RandomWordsState createState() => RandomWordsState();
}
