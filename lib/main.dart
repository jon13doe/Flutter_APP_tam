import 'package:tam_app/global_imports.dart';

import 'package:tam_app/features/tam_app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<DataList>(create: (_) => DataList()),
        ChangeNotifierProvider<ModelProvider>(create: (_) => ModelProvider()),
      ],
      child: const TAMApp(),
    ),
  );
}