import 'package:tam_app/global_imports.dart';

class LoginButton extends StatelessWidget {
  final IconData? loginIco;
  final String text;

  const LoginButton({
    super.key,
    required this.text,
    this.loginIco,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 48,
      padding: const EdgeInsets.all(10.0), // Внутрішні відступи кнопки
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue, // Колір рамки
          width: 2.0, // Товщина рамки
        ),
        borderRadius: BorderRadius.circular(8.0), // Закруглені кути
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: loginIco != null ? FaIcon(
                    loginIco,
                    size: 24,
                  ) : Container(),
          ),
          Text(
            text,
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}
