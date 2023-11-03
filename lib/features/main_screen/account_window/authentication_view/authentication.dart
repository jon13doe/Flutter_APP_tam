import 'package:tam_app/global_imports.dart';
import 'widgets/index.dart';

class Authentication extends StatefulWidget {
  final Function(bool) onPush;

  const Authentication({super.key, required this.onPush});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool signInUp = true;
  void toggleSignInUp(bool newValue) {
    setState(() {
      signInUp = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const JoinText(),
                onTap: () {
                  setState(() {
                    widget.onPush(true);
                  });
                },
              ),
              Visibility(
                visible: signInUp ? false : true,
                child: SignUp(onPush: toggleSignInUp),
              ),
              Visibility(
                visible: signInUp,
                child: SignIn(onPush: toggleSignInUp),
              ),
                      const ContactsRow(withImg: false,),
            ],
          ),
        ),
      ],
    );
  }
}