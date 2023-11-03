import 'package:flutter/gestures.dart';
import 'package:tam_app/features/widgets/login_button.dart';
import 'package:tam_app/global_imports.dart';

class SignUp extends StatefulWidget {
  final Function(bool) onPush;

  const SignUp({super.key, required this.onPush});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: SizedBox(
            width: 0.8 * MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                  obscureText: obscureText,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const LoginButton(
            text: 'Sign up with email',
            loginIco: FontAwesomeIcons.envelope,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const LoginButton(
          text: 'Sign up with Google',
          loginIco: FontAwesomeIcons.google,
        ),
        const SizedBox(
          height: 32,
        ),
        RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Sign In",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    widget.onPush(true);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}