class Todo {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  Todo(
      {required this.title,
      required this.description,
      required this.publishedAt,
      required this.url,
      required this.urlToImage});

  factory Todo.fromJson(Map<String, dynamic> jsonData) {
    return Todo(
        description: jsonData["description"],
        url: jsonData['url'],
        urlToImage: jsonData['urlToImage'],
        publishedAt: jsonData['publishedAt'],
        title: jsonData['title']);
  }
}
