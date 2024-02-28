class Book {
  final String title;
  final String author;
  final String id;
  final String borrower;
  final String date;

  Book({
    required this.title,
    required this.author,
    required this.id,
    required this.borrower,
    required this.date,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      id: json['id'],
      borrower: json['borrower'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'id': id,
      'borrower': borrower,
      'date': date,
    };
  }
}
