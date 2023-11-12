import 'package:tam_app/global_imports.dart';

class TAMBottomNavigationBar extends StatefulWidget {
  const TAMBottomNavigationBar({super.key});

  @override
  State<TAMBottomNavigationBar> createState() => _TAMBottomNavigationBarState();
}

class _TAMBottomNavigationBarState extends State<TAMBottomNavigationBar> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentPageIndex,
      onTap: (int index) {
        setState(() {
          _currentPageIndex = index;
          switch (index) {
            case 1:
              context.go('/shows');
              break;
            case 2:
              context.go('/models');
              break;
            case 3:
              context.go('/school');
              break;
            default:
              context.go('/');
              break;
          }
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Symbols.podiatry),
          label: 'Shows',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.diamond),
          label: 'Models',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_note),
          label: 'School',
        ),
      ],
    );
  }
}
