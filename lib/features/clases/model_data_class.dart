import 'package:tam_app/global_imports.dart';


class ModelProvider extends ChangeNotifier {
  ModelClass? _modelData;

  // Отримати дані моделі
  ModelClass? get modelData => _modelData;

  // Встановити дані моделі та сповістити слухачів
  void setModelData(ModelClass modelData) {
    _modelData = modelData;
    notifyListeners();
  }

  // Статичний метод для отримання доступу до ModelProvider через контекст
  static ModelProvider of(BuildContext context) {
    return Provider.of<ModelProvider>(context, listen: false);
  }
}