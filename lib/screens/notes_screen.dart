import 'package:flutter/material.dart';
import 'package:flutter_notes/providers/notes_provider.dart';
import 'package:flutter_notes/screens/note_details_screen.dart';
import 'package:flutter_notes/widgets/note_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({Key? key}) : super(key: key);

  final _accentColors = [
    Colors.deepPurpleAccent.shade100,
    Colors.deepOrangeAccent.shade100,
    Colors.greenAccent.shade100,
    Colors.blueAccent.shade100,
    Colors.redAccent.shade100,
    Colors.pinkAccent.shade100,
    Colors.tealAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.plus),
            onPressed: () {
              // TODO: new note page
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: notes.items.length,
          itemBuilder: (context, index) => NoteCard(
            title: notes.items[index].title,
            body: notes.items[index].body,
            dateTime: notes.items[index].dateTime,
            color: _accentColors[index % _accentColors.length],
            onTap: () {
              Navigator.of(context).pushNamed(
                NoteDetailsScreen.routeName,
                arguments: notes.items[index].id,
              );
            },
          ),
        ),
      ),
    );
  }
}
