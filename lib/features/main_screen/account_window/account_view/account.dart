import 'package:tam_app/features/api/model_data_api.dart';
import 'package:tam_app/global_imports.dart';

class Account extends StatefulWidget {
  const Account({
    Key? key,
  }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late ModelProvider modelProvider;
  ModelClass model = ModelClass();
  bool dataLoaded = false; // Додали стан для відстеження завантаження даних

  @override
  void initState() {
    super.initState();

    final userEmail = Provider.of<UserProvider>(context, listen: false).email;

    modelProvider = Provider.of<ModelProvider>(context, listen: false);
    fetchModelData(userEmail);
  }

  // Отримання даних моделі за email
  void fetchModelData(String email) async {
    final modelData = await ModelDataApi().fetchDataFromGoogleScript(email);

    setState(() {
      model = modelData;  // Присвоюємо model лише після успішного отримання даних
      dataLoaded = true; // Встановлюємо флаг завантаження даних
    });

    print('Імя: ${model.name}');
    print('група: ${model.group}');
  }

  @override
  Widget build(BuildContext context) {
    if (!dataLoaded) {
      // Дані ще не завантажені. Відображаємо прогрес завантаження.
      return LinearProgressIndicator();
    }

    // Дані завантажені. Відображаємо вміст.
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(model.name),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Provider.of<UserProvider>(context, listen: false)
                          .setEmail(null);
                      Provider.of<UserProvider>(context, listen: false)
                          .setIsLogin(false);
                    },
                    child: const Text('Log Out'),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.network(
                          model.mainPhoto,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Age: ${calculateAge(model.dateOfBirth)}'),
                              Text('Hight: ${model.height}'),
                              Text('Weight: ${model.weight}'),
                              Text('Hair color: ${model.hairColor}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              Color color = index % 2 == 0 ? Colors.black : Colors.grey;
              final photosList = [
                ...model.portfolioPhotos,
                ...model.otherPhotos
              ];
              final photoUrl = photosList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  color: color,
                  height: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Image.network(
                      photoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            childCount: model.portfolioPhotos.length + model.otherPhotos.length,
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