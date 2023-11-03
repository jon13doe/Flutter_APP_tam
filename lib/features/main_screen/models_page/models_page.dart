import 'package:tam_app/global_imports.dart';

class Models extends StatelessWidget {
  const Models({super.key});

  @override
  Widget build(BuildContext context) {
    final modelsList = Provider.of<DataList>(context).models;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Color color = index % 2 == 0 ? Colors.black : Colors.grey;
                ModelsClass model =
                    modelsList[index]; // Отримання конкретної моделі

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Container(
                    color: color,
                    height: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.white,
                                  // Відображення фото з портфоліо моделі
                                  child:
                                      Image.network(model.portfolioPhotoUrl[0]),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.white,
                                  // Відображення фото з портфоліо моделі
                                  child:
                                      Image.network(model.portfolioPhotoUrl[1]),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.white,
                                  // Відображення фото з портфоліо моделі
                                  child:
                                      Image.network(model.portfolioPhotoUrl[2]),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
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
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  color: Colors.white,
                                  // Відображення головного фото моделі
                                  child: Image.network(model.mainPhotoUrl),
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Name: ${model.name}'),
                                        Text('Age: ${calculateAge(model.dateOfBirth)}'),
                                        Text('Hight: ${model.height}'),
                                        Text('Weight: ${model.weight}'),
                                        Text('Hair color: ${model.hairColor}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: modelsList.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(
              child: ContactsRow(withImg: true,),
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
