import 'package:flutter/gestures.dart';
import 'package:tam_app/features/widgets/login_button.dart';
import 'package:tam_app/global_imports.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  final Function(bool) onPush;
  final Function(bool) onPushSignUp;

  const SignUp({
    super.key,
    required this.onPush,
    required this.onPushSignUp,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordControllerValidator =
      TextEditingController();
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
                      return 'Please enter your password';
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
                TextFormField(
                  controller: _passwordControllerValidator,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
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
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            String email = _emailController.text;
            String password = _passwordController.text;
            String passwordValidator = _passwordControllerValidator.text;

            if (EmailValidator.validate(email)) {
              if (password.length > 5) {
                if (password == passwordValidator) {
                  Auth().registerWithEmailAndPassword(email, password);
                  widget.onPushSignUp(true);
                } else {
                  showDialog(
                    context:
                        context,
                    builder: (context) {
                      return const AlertDialogWithTimer(
                        text: 'Passwords dont match',
                        time: 3,
                      );
                    },
                  );
                }
              } else {
                showDialog(
                  context:
                      context,
                  builder: (context) {
                    return const AlertDialogWithTimer(
                      text: 'Password must have atleast 6 chars',
                      time: 3,
                    );
                  },
                );
              }
            } else {
              showDialog(
                context:
                    context,
                builder: (context) {
                  return const AlertDialogWithTimer(
                    text: 'Enter correct email.',
                    time: 3,
                  );
                },
              );
            }
          },
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
