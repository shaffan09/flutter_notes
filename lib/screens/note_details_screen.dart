import 'package:flutter/material.dart';
import 'package:flutter_notes/providers/notes_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NoteDetailsScreen extends StatelessWidget {
  static const routeName = '/note-datails';

  const NoteDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteId = ModalRoute.of(context)!.settings.arguments;
    final note = Provider.of<NotesProvider>(
      context,
      listen: false,
    ).findById(noteId as String);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Row(
            children: [
              IconButton(
                // color: Colors.lightBlueAccent,
                icon: const FaIcon(FontAwesomeIcons.penToSquare),
                onPressed: () {
                  // logic to go edit screen
                },
              ),
              const SizedBox(width: 4),
              IconButton(
                // color: Colors.redAccent,
                icon: const FaIcon(FontAwesomeIcons.trash),
                onPressed: () {
                  var isDeleting = showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Are you sure!'),
                      content: const Text(
                          'Are you sure you want to delete this note?'),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            elevation: 0,
                            primary: Colors.blueAccent,
                          ),
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            elevation: 0,
                            primary: Colors.redAccent,
                          ),
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        )
                      ],
                    ),
                  ).then((value) {
                    // deleting note if user pressed yes
                    if (value == true) {
                      Provider.of<NotesProvider>(
                        context,
                        listen: false,
                      ).deleteNote(noteId);

                      Navigator.of(context).pop();
                    }
                  });
                },
              ),
            ],
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                DateFormat.yMMMMd('en_us').format(note.dateTime),
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                note.body,
                style: const TextStyle(
                  height: 1.5,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
