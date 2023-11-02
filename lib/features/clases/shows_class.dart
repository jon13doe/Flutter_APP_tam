class ShowsClass {
  String date;
  String name;
  String text;
  String imageUrl;

  ShowsClass({
    required this.date,
    required this.name,
    required this.text,
    required this.imageUrl,
  });

  factory ShowsClass.fromJson(dynamic json) {
    return ShowsClass(
      date: '${json['date']}',
      name: '${json['name']}',
      text: '${json['text']})',
      imageUrl: '${json['main_photo']}',
    );
  }
}
