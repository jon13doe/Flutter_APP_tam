class NewsClass {
  final String name;
  final String text;
  final String imageUrl;

  NewsClass({
    required this.name,
    required this.text,
    required this.imageUrl,
  });

  factory NewsClass.fromJson(Map<String, dynamic> json) {
    return NewsClass(
      name: json['name'],
      text: json['text'],
      imageUrl: json['main_photo'],
    );
  }
}
