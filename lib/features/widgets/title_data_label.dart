import 'package:tam_app/global_imports.dart';

class TitleDataLabel extends StatelessWidget {
  final String title;
  final String side;
  final double customWidth;

  const TitleDataLabel({
    super.key,
    required this.title,
    required this.side,
    required this.customWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: side == 'left' ? 0 : null,
      top: side == 'left' ? 10 : null,
      right: side == 'right' ? 0 : null,
      bottom: side == 'right' ? 10 : null,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: customWidth,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: side == 'left' ? Radius.zero : const Radius.circular(8),
              topRight: side == 'left' ? const Radius.circular(8) : Radius.zero,
              bottomLeft:
                  side == 'left' ? Radius.zero : const Radius.circular(8),
              bottomRight:
                  side == 'left' ? const Radius.circular(8) : Radius.zero,
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              8,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
