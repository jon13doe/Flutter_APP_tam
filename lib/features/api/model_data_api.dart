import 'package:tam_app/global_imports.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ModelDataApi {
  Future<ModelClass> fetchDataFromGoogleScript(String email) async {
    const scriptUrl = 'https://script.google.com/macros/s/AKfycbz_9LY__Z5YrBK5iyVDy5X7SAUmBNPDm7PqpoG_o3WGeHMEcIZjiP2FCvvW9HcFcog/exec';

    final Uri url = Uri.parse(scriptUrl);
    final Map<String, String> queryParams = {
      'inputString': email,
    };
    final uri = url.replace(queryParameters: queryParams);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ModelClass.fromJson(data);
    } else {
      throw Exception('Помилка завантаження даних');
    }
  }
}