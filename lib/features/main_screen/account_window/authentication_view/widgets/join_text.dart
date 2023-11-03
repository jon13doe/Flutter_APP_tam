import 'package:tam_app/global_imports.dart';

class JoinText extends StatelessWidget {
  const JoinText({super.key});

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: "Join Teen Age\n",
          style: TextStyle(fontSize: 32, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: "Models Ukraine",
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
