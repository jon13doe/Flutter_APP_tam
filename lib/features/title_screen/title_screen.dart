import 'package:tam_app/global_imports.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final data = await SheetDataApi.fetchDataFromGoogleScript();

      final dataProvider = Provider.of<DataList>(context, listen: false);

      dataProvider.setParsedData(
        eventsData: data['eventList']?.cast<EventsClass>(),
        newsData: data['newsList']?.cast<NewsClass>(),
        showsData: data['showList']?.cast<ShowsClass>(),
        modelsData: data['modelsList']?.cast<ModelsClass>(),
      );

      context.go('/');

    } catch (e) {
      print('Помилка під час отримання даних: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 32,
            child: Image.asset(
              'assets/logo/logo_white.png',
            ),
          ),
        ],
      ),
    );
  }
}


// class TitleScreen extends StatefulWidget {
//   const TitleScreen({super.key});

//   @override
//   State<TitleScreen> createState() => _TitleScreenState();
// }

// class _TitleScreenState extends State<TitleScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(
//       const Duration(seconds: 3),
//       () => context.go('/'),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 32,
//             child: Image.asset(
//               'assets/logo/logo_white.png',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }