import 'package:tam_app/global_imports.dart';

class Shows extends StatefulWidget {
  const Shows({super.key});

  @override
  State<Shows> createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataFromSheet>(
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
                                title: showsList[index].title,
                                photoUrls: showsList[index].otherImagesUrls,
                              );
                            },
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: screenWidth,
                              color: Colors.black,
                              child: Center(
                                child: Image.network(
                                  showsList[index].mainImageUrl,
                                ),
                              ),
                            ),
                            TitleDataLabel(
                              title: showsList[index].title,
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
              child: ContactsRow(
                withImg: true,
              ),
            ),
          ],
        );
      },
    );
  }
}
