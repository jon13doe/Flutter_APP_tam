import 'package:tam_app/global_imports.dart';

class Show extends StatefulWidget {
  const Show({super.key});

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataList>(
      builder: (context, dataList, child) {
        final showsList = dataList.shows;
        double screenWidth = MediaQuery.of(context).size.width;

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: InkWell(
                        onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialogForEvents(
                      text: showsList[index].text,
                      title: showsList[index].name,
                    );
                  },
                );
              },
                        child: Stack(
                          children: [
                            Container(
                              height: screenWidth,
                              color: Colors.grey,
                              child: Center(
                                child: Image.network(
                                  showsList[index].imageUrl,
                                ),
                              ),
                            ),
                            TitleDataLabel(
                              title: showsList[index].name,
                              side: 'left',
                              customWidth: 0.75 * screenWidth,
                            ),
                            DateDataLabel(
                              data: showsList[index].date,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: showsList.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: ContactsRow(withImg: true,),
            ),
          ],
        );
      },
    );
  }
}
