import 'package:tam_app/global_imports.dart';

class DataFromSheet with ChangeNotifier {
  List<EventsClass> events = [];
  List<NewsClass> news = [];
  List<ShowsClass> shows = [];
  List<ModelsClass> models = [];

  void setParsedData({
    List<EventsClass>? eventsData,
    List<NewsClass>? newsData,
    List<ShowsClass>? showsData,
    List<ModelsClass>? modelsData,
  }) {
    events = eventsData ?? [];
    news = newsData ?? [];
    shows = showsData ?? [];
    models = modelsData ?? [];

    notifyListeners();
  }
}
