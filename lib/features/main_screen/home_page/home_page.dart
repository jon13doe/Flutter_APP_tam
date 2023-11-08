import 'package:tam_app/global_imports.dart';
import 'parts/events_view.dart';
import 'parts/news_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 8,
          ),
        ),
        Consumer<DataList>(
          builder: (context, dataList, child) {
            return EventsView(
              eventsList: dataList.events,
            );
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 8,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 96,
            color: Colors.black,
            child: Center(
              child: Image.asset(
                'assets/logo/logo_horizontal_dark.png',
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 8,
          ),
        ),
        Consumer<DataList>(
          builder: (context, dataList, child) {
            return NewsView(
              newsList: dataList.news,
            );
          },
        ),
        const SliverToBoxAdapter(
              child: ContactsRow(withImg: true,),
            ),
      ],
    );
  }
}
