import 'package:flutter/cupertino.dart';
import 'package:flutter_notes/helpers/db_helper.dart';
import 'package:flutter_notes/models/note.dart';
import 'package:uuid/uuid.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get items {
    return [..._notes];
  }

  // method to find note by id
  Note findById(String id) {
    return _notes.firstWhere((note) => note.id == id);
  }

  // method to fetch notes from db and set them on notes list
  Future<void> fetchAndSetNotes() async {
    final notes = await DBHelper.getData('notes');

    _notes = notes.map(
      (note) {
        return Note(
          id: note['id'].toString(),
          title: note['title'].toString(),
          body: note['body'].toString(),
          dateTime: DateTime.parse(note['dateTime'].toString()),
        );
      },
    ).toList();

    notifyListeners();
  }

  // method to add a new note
  Future<void> addNote(String title, String body) async {
    // an object used to generate random id's
    var uuid = const Uuid();

    final newNote = Note(
      id: uuid.v4(),
      title: title,
      body: body,
      dateTime: DateTime.now(),
    );

    _notes.insert(
      0,
      newNote,
    );

    await DBHelper.insert('notes', {
      'id': newNote.id,
      'title': newNote.title,
      'body': newNote.body,
      'dateTime': newNote.dateTime.toString(),
    });

    notifyListeners();
  }

  Future<void> deleteNote(String id) async {
    _notes.removeWhere((note) => note.id == id);

    await DBHelper.delete(id);

    notifyListeners();
  }
}
