// import 'package:tam_app/features/widgets/login_button.dart';
import 'package:tam_app/global_imports.dart';

class VerifyEmailScreen extends StatelessWidget {
  final Function(bool) onPush;

  const VerifyEmailScreen({
    super.key,
    required this.onPush,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Email was send'),
        const SizedBox(
          height: 32,
        ),
        // InkWell(
        //   onTap: () {},
        //   child: const LoginButton(
        //     text: 'Send again',
        //     loginIco: Icons.mail,
        //   ),
        // ),
        // const SizedBox(
        //   height: 32,
        // ),
        TextButton(
          onPressed: () {
            onPush(true);
          },
          child: const Text('Go to SignUp'),
        ),
      ],
    );
  }
}
