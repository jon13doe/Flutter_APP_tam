import 'package:tam_app/global_imports.dart';
import 'package:tam_app/features/tam_app.dart';

Future<void> main() async {
    runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DataFromSheet>(create: (_) => DataFromSheet()),
      ],
      child: const TAMApp(),
    ),
  );
}