import 'package:tam_app/global_imports.dart';

class CustomIconButton extends StatefulWidget {
  final Icon icon;
  final Uri url;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.url,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.icon,
      onPressed: () {
        launchUrl(
          widget.url,
        );
      },
    );
  }
}
