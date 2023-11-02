import 'package:tam_app/global_imports.dart';

class EventsView extends StatefulWidget {
  final List<EventsClass> eventsList;

  const EventsView({Key? key, required this.eventsList}) : super(key: key);

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  double screenWidth = MediaQuery.of(context).size.width;
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.grey,
                            width: screenWidth,
                            child: Center(
                              child: Image.network(widget.eventsList[index].imageUrl),
                            ),
                          ),
                          TitleDataLabel(
                            title: widget.eventsList[index].name,
                            side: 'left',
                            customWidth: 0.75 * screenWidth,
                          ),
                          DateDataLabel(data: widget.eventsList[index].date),
                        ],
                      ),
                    ),
                  );
                },
                childCount: widget.eventsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
