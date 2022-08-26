import 'package:flutter/cupertino.dart';

class Note with ChangeNotifier {
  final String id;
  String title;
  String body;
  final DateTime dateTime;
  bool isPinned;

  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
    this.isPinned = false,
  });

  void updateTitle(String title) {
    this.title = title;
  }

  void updatebody(String body) {
    this.body = body;
  }

  void toggleIsPinned() {
    isPinned = !isPinned;
    notifyListeners();
  }
}
