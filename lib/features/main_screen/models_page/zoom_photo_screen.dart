import 'package:tam_app/global_imports.dart';

class ZoomPhotoScreen extends StatelessWidget {
  final String photoUrl;
  final String tag;

  const ZoomPhotoScreen({super.key, required this.photoUrl, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: tag,
            child: Image.network(
              photoUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}