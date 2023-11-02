class EventsClass {
  final String date;
  final String name;
  final String imageUrl;
  final String text;
  

  EventsClass({
    required this.date,
    required this.name,
    required this.imageUrl,
    required this.text,
  });

  factory EventsClass.fromJson(Map<String, dynamic> json) {
    return EventsClass(
      date: json['date'] as String,
      name: json['name'] as String,
      imageUrl: json['main_photo'] as String,
      text: json['text'] as String,
    );
  }
}