import 'package:flutter/cupertino.dart';
import 'package:flutter_notes/models/note.dart';
import 'package:uuid/uuid.dart';

class NotesProvider with ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get items {
    return [..._notes];
  }

  // method to find note by id
  Note findById(String id) {
    return _notes.firstWhere((note) => note.id == id);
  }

  // method to fetch notes from db and set them on notes list
  Future<void> fetchAndSetNotes() async {
    // TODO: logic to fetch notes from db
    notifyListeners();
  }

  // method to add a new note
  Future<void> addNote(String title, String body) async {
    // an object used to generate random id's
    var uuid = const Uuid();

    _notes.insert(
      0,
      Note(
        id: uuid.v4(),
        title: title,
        body: body,
        dateTime: DateTime.now(),
      ),
    );
    // TODO: add the logic too add new note o database
    notifyListeners();
  }

  Future<void> deleteNote(String id) async {
    _notes.removeWhere((note) => note.id == id);
    // TODO: add the logic to remove note from db as well
    notifyListeners();
  }
}
