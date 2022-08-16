import 'package:flutter/cupertino.dart';
import 'package:flutter_notes/models/note.dart';
import 'package:uuid/uuid.dart';

class NotesProvider with ChangeNotifier {
  final List<Note> _notes = [
    Note(id: '1', title: 'Shit', body: 'a shit body', dateTime: DateTime.now()),
    Note(
        id: '2',
        title: 'Shit',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
        dateTime: DateTime.now()),
    Note(
        id: '3',
        title: 'Shit',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
        dateTime: DateTime.now()),
    Note(
        id: '4',
        title: 'Shit',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
        dateTime: DateTime.now()),
    Note(
        id: '5',
        title: 'Shit',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
        dateTime: DateTime.now()),
  ];

  List<Note> get items {
    return [..._notes];
  }

  // method to fetch notes from db and set them on notes list
  Future<void> fetchAndSetNotes() async {}

  // method to add a new note
  Future<void> addNote(String title, String body) async {
    // an object used to generate random id's
    var uuid = const Uuid();

    _notes.add(Note(
      id: uuid.v4(),
      title: title,
      body: body,
      dateTime: DateTime.now(),
    ));
    // TODO: add the logic too add new note o database
  }

  Future<void> deleteNote(String id) async {
    _notes.removeWhere((note) => note.id == id);
    // TODO: add the logic to remove note from db as well
  }
}
