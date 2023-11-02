import 'package:tam_app/global_imports.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SheetDataApi {
  static Future<Map<String, List<dynamic>>> fetchDataFromGoogleScript() async {
    final response = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbxlSPwbKh7pZoVEzncXvvdisbAeA59Nfhfi-q7DlsMNX7-XMCWntW891uW-H2567VO4/exec'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      final Map<String, List<dynamic>> parsedData = {
        'eventList': [],
        'newsList': [],
        'showList': [],
        'modelsList': [],
      };

      for (var item in decodedData['event']) {
        parsedData['eventList']?.add(EventsClass.fromJson(item));
      }

      for (var item in decodedData['news']) {
        parsedData['newsList']?.add(NewsClass.fromJson(item));
      }

      for (var item in decodedData['show']) {
        parsedData['showList']?.add(ShowsClass.fromJson(item));
      }

      for (var item in decodedData['models']) {
        parsedData['modelsList']?.add(ModelsClass.fromJson(item));
      }

      return parsedData;
    } else {
      throw Exception('Помилка завантаження даних');
    }
  }
}