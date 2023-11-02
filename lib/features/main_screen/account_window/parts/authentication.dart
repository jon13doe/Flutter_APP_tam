import 'package:flutter/gestures.dart';
import 'package:tam_app/features/widgets/login_button.dart';
import 'package:tam_app/global_imports.dart';

class Authentication extends StatefulWidget {
  final Function(bool) onPush;

  const Authentication({super.key, required this.onPush});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  int signInUp = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              InkWell(
                child: const Text(
                  'Join Ten Age',
                  style: TextStyle(fontSize: 32),
                ),
                onTap: () {
                  setState(() {
                    widget.onPush(true);
                  });
                },
              ),
              const Text(
                'Models Ukraine',
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(
                height: 32,
              ),
              Visibility(
                visible: signInUp == 0 ? true : false,
                child: Column(
                  children: [
                    const LoginButton(
                      text: 'Sign up with Google',
                      loginIco: FontAwesomeIcons.google,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const LoginButton(
                      text: 'Sign up with email',
                      loginIco: FontAwesomeIcons.envelope,
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
                                setState(() {
                                  signInUp = 1;
                                });
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: signInUp == 1 ? true : false,
                child: Column(
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
                                      setState(() {
                                        signInUp = 0;
                                      });
                                    },
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            controller: emailController,
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                          ),
                          TextField(
                            controller: passwordController,
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value ?? false;
                                  });
                                },
                              ),
                              const Text('Remember me'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const LoginButton(
                      text: 'Sign in',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const LoginButton(
                      text: 'Sign in with Google',
                      loginIco: FontAwesomeIcons.google,
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
                                setState(() {
                                  signInUp = 0;
                                });
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
