import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;
  final String title;
  final String body;

  Article({required this.id, required this.title, required this.body});

  @override
  List<Object> get props => [id, title, body];

  // Factory constructor for creating an Article from JSON
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
