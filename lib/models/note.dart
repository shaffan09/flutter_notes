class Note {
  final String id;
  String title;
  String body;
  final DateTime dateTime;

  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
  });

  void updateTitle(String title) {
    this.title = title;
  }

  void updatebody(String body) {
    this.body = body;
  }
}
