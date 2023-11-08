import 'package:flutter/gestures.dart';
import 'package:tam_app/features/widgets/login_button.dart';
import 'package:tam_app/global_imports.dart';

class SignIn extends StatefulWidget {
  final Function(bool) onPush;

  const SignIn({
    super.key,
    required this.onPush,
  });

  @override
  State<SignIn> createState() => _SignInState();
}

void showErrorDialog(
  BuildContext context,
  String errorMessage,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialogWithTimer(
        text: errorMessage,
      );
    },
  );
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 0.8 * MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "or ",
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: "create an account",
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
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
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
              // Row(
              //   children: [
              //     Checkbox(
              //       value: Provider.of<UserProvider>(context)
              //           .userInformation['stayLogin'],
              //       onChanged: (value) {
              //         Provider.of<UserProvider>(context, listen: false)
              //             .setstayLogin(value!);
              //       },
              //     ),
              //     const Text('Remember me'),
              //   ],
              // ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
         InkWell(
          onTap: () async {
            String email = _emailController.text;
            String password = _passwordController.text;

            try {
              await Auth().signInWithEmailAndPassword(email, password);

              FirebaseAuth.instance.authStateChanges().listen((User? user) {
                if (user != null) {
                  Provider.of<UserProvider>(context, listen: false).setIsLogin(true);
                  Provider.of<UserProvider>(context, listen: false).setEmail(email);
                  setState(() {
                    widget.onPush(false); // Відновіть відображення Account відразу після входу
                  });
                }
              });
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found' || e.code == 'wrong-password') {
                showErrorDialog(context, 'Incorrect email or password.');
              }
            }
          },
          child: const LoginButton(
            text: 'Sign in',
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {},
          child: const LoginButton(
            text: 'Sign in with Google',
            loginIco: FontAwesomeIcons.google,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Sign Up",
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
