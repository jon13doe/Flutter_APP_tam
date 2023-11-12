import 'package:tam_app/global_imports.dart';

class TAMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAMAppBar({super.key});
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: null,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Image.asset(
            'assets/logo/logo_white.png',
            scale: 1.5,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
