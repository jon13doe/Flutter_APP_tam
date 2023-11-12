class EventsClass {
  final String title;
  final String date;
  final String text;
  final String mainImageUrl;
  final List<String>? otherImagesUrls;

  EventsClass({
    required this.title,
    required this.date,
    required this.text,
    required this.mainImageUrl,
    this.otherImagesUrls,
  });

  factory EventsClass.fromJson(Map<String, dynamic> json) {
    List<String>? otherImagesUrlsList;

    if (json['other_photo'] != null) {
      final otherImagesUrlsString = json['other_photo'] as String;
      otherImagesUrlsList = otherImagesUrlsString.split(', ');
    } else {
      otherImagesUrlsList = null;
    }

    return EventsClass(
      title: json['title'] as String,
      date: json['date'] as String,
      text: json['text'] as String,
      mainImageUrl: json['main_photo'] as String,
      otherImagesUrls: otherImagesUrlsList,
    );
  }
}
