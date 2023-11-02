import 'package:tam_app/global_imports.dart';
import 'parts/authentication.dart';
import 'parts/account.dart';

class AccountWindow extends StatefulWidget {
  const AccountWindow({Key? key}) : super(key: key);

  @override
  State<AccountWindow> createState() => _AccountWindowState();
}

class _AccountWindowState extends State<AccountWindow> {
  bool authentication = false;
  void toggleAuthentication(bool newValue) {
    setState(() {
      authentication = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return authentication
        ? Account(onPush: toggleAuthentication)
        : Authentication(onPush: toggleAuthentication);
  }
}
