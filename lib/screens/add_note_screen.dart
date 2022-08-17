import 'package:flutter/material.dart';
import 'package:flutter_notes/providers/notes_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  static const routeName = '/add-note';

  AddNoteScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _body = '';

  String? _inputValidator(String? value) {
    if (value == null) {
      return 'Please enter something!';
    }

    return null;
  }

  void _trySubmit(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      Provider.of<NotesProvider>(
        context,
        listen: false,
      ).addNote(_title, _body);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.floppyDisk),
            onPressed: () {
              _trySubmit(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // title input
                TextFormField(
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note Title',
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                  validator: _inputValidator,
                  onSaved: (title) => _title = title!,
                ),
                const SizedBox(height: 8),
                // body input
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 6,
                  maxLines: null,
                  style: const TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note description',
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                  validator: _inputValidator,
                  onSaved: (body) => _body = body!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
