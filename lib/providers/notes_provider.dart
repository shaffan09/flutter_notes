import 'package:flutter/cupertino.dart';
import 'package:flutter_notes/models/note.dart';
import 'package:uuid/uuid.dart';

class NotesProvider with ChangeNotifier {
  final List<Note> _notes = [
    Note(
      id: '1',
      title: 'This is a note',
      body: 'This is a short note body',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '2',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '3',
      title: 'This is a note',
      body:
          'Proin vehicula nec enim vel posuere. Sed tortor velit, imperdiet et ante vel, viverra tincidunt enim. Quisque magna ex, consectetur eget lacus eu, suscipit pellentesque arcu. Pellentesque laoreet vestibulum pellentesque. Mauris iaculis ullamcorper risus, et fringilla tortor tristique nec. Suspendisse non dui purus. Nunc porttitor eros sed leo molestie, at luctus eros mollis. Nunc porttitor est in orci sodales, et lobortis sapien congue. Morbi dignissim nibh et libero viverra, consectetur mollis est viverra. Donec vitae purus vel massa varius scelerisque. Donec auctor, metus sit amet laoreet malesuada, mi quam volutpat leo, nec elementum mi turpis nec sem. Morbi eget imperdiet lorem. Donec volutpat odio diam, id porttitor urna sagittis a. Aenean vel ante risus. Sed quis cursus urna, a auctor velit. Donec elementum accumsan quam, eget malesuada quam blandit ac. Morbi venenatis ipsum ut tortor sollicitudin, facilisis tempus magna viverra. Morbi ut turpis quam. Integer viverra eu quam vel pharetra. Praesent ipsum ipsum, commodo at ullamcorper eu, tempus nec est. Proin sit amet massa vel nulla aliquam fermentum eget nec dolor. Phasellus aliquam nec nulla et fermentum. Phasellus fringilla sem sed justo pellentesque tincidunt. Nam eget erat id mi volutpat interdum in vitae ipsum. Fusce sodales, sapien ac tincidunt mollis, lacus diam egestas nibh, sed mattis leo lectus ut est. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed quis quam quis erat imperdiet maximus sed eu ex. Quisque non urna eu dui aliquet blandit a nec lacus.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '4',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '5',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '6',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '7',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '8',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '9',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '10',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '11',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '12',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '13',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '14',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
    Note(
      id: '15',
      title: 'This is a note',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      dateTime: DateTime.now(),
    ),
  ];

  List<Note> get items {
    return [..._notes];
  }

  // method to find note by id
  Note findById(String id) {
    return _notes.firstWhere((note) => note.id == id);
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
