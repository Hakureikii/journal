class JournalModel {
  String title;
  String content;
  String category;
  String mood;
  DateTime dateTime;
  int rating;

  JournalModel({
    required this.title,
    required this.content,
    required this.category,
    required this.mood,
    required this.dateTime,
    required this.rating,
  });
}
