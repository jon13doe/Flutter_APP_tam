import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tam_app/features/tam_app.dart';
import 'parsed_data.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataList()),
      ],
      child: const TAMApp(),
    ),
  );
}