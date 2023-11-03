import 'package:tam_app/global_imports.dart';

class Account extends StatefulWidget {
  final Function(bool) onPush;

  const Account({Key? key, required this.onPush}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  widget.onPush(false);
                },
                child: const Text('Log Out'),
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  Text(
                    'name',
                    style: TextStyle(
                      color: Colors.black,
                    ),
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
                    // ignore: prefer_const_constructors
                    child: Stack(
                      children: const [
                        // Image.asset(
                        //   ,
                        //   fit: BoxFit.cover,
                        // ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Age:  __'),
                              Text('Weight:  __'),
                              Text('option 1:  __'),
                              Text('option 2:  __'),
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
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  color: color,
                  height: MediaQuery.of(context).size.width,
                  child: const Center(
                      // child: Image.asset(),
                      ),
                ),
              );
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }
}
