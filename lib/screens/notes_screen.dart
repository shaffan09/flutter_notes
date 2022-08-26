import 'package:flutter/material.dart';
import 'package:flutter_notes/providers/notes_provider.dart';
import 'package:flutter_notes/screens/add_note_screen.dart';
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

  late Offset _tapPosition;

  void _storeTapPosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  Future<void> _refreshNotes(BuildContext context) async {
    await Provider.of<NotesProvider>(context, listen: false).fetchAndSetNotes();
  }

  Widget _buildPopuMenuItem(IconData icon, String text, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: color),
        ),
        FaIcon(
          icon,
          color: color,
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context, String noteId, bool isPinned) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    var isDeleting = false;

    showMenu(
      color: Theme.of(context).primaryColor,
      context: context,
      position: RelativeRect.fromRect(
        _tapPosition & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          child: _buildPopuMenuItem(
            FontAwesomeIcons.thumbtack,
            isPinned ? 'Unpin' : 'Pin',
            Colors.white,
          ),
          onTap: () {
            Provider.of<NotesProvider>(
              context,
              listen: false,
            ).togglePinned(noteId);
          },
        ),
        PopupMenuItem(
          child: _buildPopuMenuItem(
            FontAwesomeIcons.trash,
            'Delete',
            Colors.redAccent,
          ),
          onTap: () {
            Provider.of<NotesProvider>(
              context,
              listen: false,
            ).deleteNote(noteId);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.plus),
            onPressed: () {
              Navigator.of(context).pushNamed(AddNoteScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _refreshNotes(context),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.lightBlueAccent,
                ),
              )
            : RefreshIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                color: Colors.white,
                onRefresh: () => _refreshNotes(context),
                child: Consumer<NotesProvider>(
                  builder: (context, notes, child) => Container(
                    margin: const EdgeInsets.all(8),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: [
                        // pinned notes
                        if (notes.pinnedNotes.isNotEmpty)
                          ...List.generate(
                            notes.pinnedNotes.length,
                            (index) {
                              var note = notes.pinnedNotes[index];
                              return NoteCard(
                                title: note.title,
                                body: note.body,
                                dateTime: note.dateTime,
                                color:
                                    _accentColors[index % _accentColors.length],
                                isPinned: note.isPinned,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    NoteDetailsScreen.routeName,
                                    arguments: note.id,
                                  );
                                },
                                onLongPress: () {
                                  _showPopupMenu(
                                    context,
                                    note.id,
                                    note.isPinned,
                                  );
                                },
                                onTapDown: _storeTapPosition,
                              );
                            },
                          ),

                        // just to bring unpinned notes next line
                        if (notes.pinnedNotes.length.isOdd)
                          const SizedBox(height: 8),

                        // unpinned notes
                        ...List.generate(
                          notes.unPinnedNotes.length,
                          (index) {
                            var note = notes.unPinnedNotes[index];
                            return NoteCard(
                              title: note.title,
                              body: note.body,
                              dateTime: note.dateTime,
                              color:
                                  _accentColors[index % _accentColors.length],
                              isPinned: note.isPinned,
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  NoteDetailsScreen.routeName,
                                  arguments: note.id,
                                );
                              },
                              onLongPress: () {
                                _showPopupMenu(
                                  context,
                                  note.id,
                                  note.isPinned,
                                );
                              },
                              onTapDown: _storeTapPosition,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
