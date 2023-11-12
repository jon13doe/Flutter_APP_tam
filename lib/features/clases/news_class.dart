class NewsClass {
  final String title;
  final String date;
  final String text;
  final String mainImageUrl;
  final List<String>? otherImagesUrls;

  NewsClass({
    required this.title,
    required this.date,
    required this.text,
    required this.mainImageUrl,
    this.otherImagesUrls,
  });

  factory NewsClass.fromJson(Map<String, dynamic> json) {
    List<String>? otherImagesUrlsList;

    if (json['other_photo'] != null) {
      final otherImagesUrlsString = json['other_photo'] as String;
      otherImagesUrlsList = otherImagesUrlsString.split(', ');
    } else {
      otherImagesUrlsList = null;
    }

    return NewsClass(
      title: json['title'],
      date: json['date'],
      text: json['text'],
      mainImageUrl: json['main_photo'],
      otherImagesUrls: otherImagesUrlsList,
    );
  }
}
