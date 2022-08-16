import 'package:flutter/material.dart';
import 'package:flutter_notes/providers/notes_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.items.length,
        itemBuilder: (context, index) => Card(
          child: Column(
            children: [
              Text(notes.items[index].title),
              Text(notes.items[index].body.length < 30
                  ? notes.items[index].body
                  : '${notes.items[index].body.substring(0, 20)}...')
            ],
          ),
        ),
      ),
    );
  }
}
