import 'package:tam_app/features/main_screen/models_page/zoom_photo_screen.dart';
import 'package:tam_app/global_imports.dart';

class Models extends StatelessWidget {
  const Models({super.key});

  @override
  Widget build(BuildContext context) {
    final modelsList = Provider.of<DataFromSheet>(context).models;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Color color = index % 2 == 0 ? Colors.black : Colors.grey;
                ModelsClass model = modelsList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Container(
                    color: color,
                    height: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListView.builder(
                              itemCount: model.portfolioPhotoUrl.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ZoomPhotoScreen(
                                          photoUrl:
                                              model.portfolioPhotoUrl[index],
                                          tag:
                                              'portfolio_photo_${model.name}_$index',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'portfolio_photo_${model.name}_$index',
                                    child: Container(
                                      color: color,
                                      margin:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Image.network(
                                        model.portfolioPhotoUrl[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Hero(
                                    tag:
                                        'main_photo_${model.name}_${model.dateOfBirth}',
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ZoomPhotoScreen(
                                              photoUrl: model.mainPhotoUrl,
                                              tag:
                                                  'main_photo_${model.name}_${model.dateOfBirth}',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        color: color,
                                        child: Image.network(
                                          model.mainPhotoUrl,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Name: ${model.name}',
                                              style: const TextStyle(
                                                fontSize: 24,
                                              ),
                                            ),
                                            Text(
                                                'Age: ${calculateAge(model.dateOfBirth)}'),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Hight: ${model.height}'),
                                                      Text(
                                                          'Weight: ${model.weight}'),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Hair color: ${model.hairColor}'),
                                                      Text(
                                                          'Hair color: ${model.eyeColor}'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: modelsList.length,
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
  }

  int calculateAge(String dateOfBirth) {
    final birthDate = DateTime.parse(dateOfBirth);
    final currentDate = DateTime.now();
    var age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
