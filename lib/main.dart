import 'package:flutter/material.dart';
import 'package:flutter_notes/providers/notes_provider.dart';
import 'package:flutter_notes/screens/add_note_screen.dart';
import 'package:flutter_notes/screens/edit_notes_screen.dart';
import 'package:flutter_notes/screens/note_details_screen.dart';
import 'package:flutter_notes/screens/notes_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Notes',
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.blueGrey.shade900,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              // fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: NotesScreen(),
        routes: {
          NoteDetailsScreen.routeName: (context) => const NoteDetailsScreen(),
          AddNoteScreen.routeName: (context) => AddNoteScreen(),
          EditNoteScreen.routeName: (context) => EditNoteScreen(),
        },
      ),
    );
  }
}
