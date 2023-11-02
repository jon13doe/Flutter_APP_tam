import 'package:tam_app/global_imports.dart';

class TAMApp extends StatefulWidget {
  const TAMApp({super.key});
  
  @override
  State<TAMApp> createState() => _TAMAppState();
}

class _TAMAppState extends State<TAMApp> {

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: customLightTheme,
      dark: customDarkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => MaterialApp.router(
        theme: light,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routerConfig: router,
      ),
    );
  }
}