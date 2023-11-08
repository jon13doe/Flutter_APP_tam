import 'package:tam_app/global_imports.dart';
import 'widgets/index.dart';

class Authentication extends StatefulWidget {
  const Authentication({
    super.key,
  });

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool signIn = true;
  bool signUp = false;
  bool verifyScreen = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const JoinText(),
              Visibility(
                visible: signIn,
                child: SignIn(
                  onPush: (bool newValue) {
                    setState(() {
                      signIn = !newValue;
                      signUp = newValue;
                    });
                  },
                ),
              ),
              Visibility(
                visible: signUp,
                child: SignUp(
                  onPush: (bool newValue) {
                    setState(() {
                      signUp = !newValue;
                      signIn = newValue;
                    });
                  },
                  onPushSignUp: (bool newValue) {
                    setState(() {
                      signIn = !newValue;
                      signUp = !newValue;
                      verifyScreen = newValue;
                    });
                  },
                ),
              ),
              Visibility(
                visible: verifyScreen,
                child: VerifyEmailScreen(
                  onPush: (bool newValue) {
                    setState(() {
                      signIn = newValue;
                      signUp = !newValue;
                      verifyScreen = !newValue;
                    });
                  },
                ),
              ),
              const ContactsRow(
                withImg: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
