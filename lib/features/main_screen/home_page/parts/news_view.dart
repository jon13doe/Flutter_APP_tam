import 'package:tam_app/global_imports.dart';

class NewsView extends StatefulWidget {
  final List<NewsClass> newsList;

  const NewsView({super.key, required this.newsList});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Color color = index % 2 == 0 ? Colors.black : Colors.grey;
          double screenWidth = MediaQuery.of(context).size.width;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialogForEvents(
                      text: widget.newsList[index].text,
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  Container(
                    color: color,
                    height: screenWidth,
                    child: Center(
                      child: Image.network(widget.newsList[index].imageUrl),
                    ),
                  ),
                  TitleDataLabel(
                    title: widget.newsList[index].name,
                    side: 'right',
                    customWidth: 0.75 * screenWidth,
                  ),
                ],
              ),
            ),
          );
        },
        childCount: widget.newsList.length,
      ),
    );
  }
}
