import 'package:tam_app/global_imports.dart';

class ContactsRow extends StatelessWidget {
  const ContactsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri urlFacebook =
        Uri.parse('https://www.facebook.com/profile.php?id=100064043010113');
    final Uri urlInstagram =
        Uri.parse('https://instagram.com/teen_age_model_ukraine');

   
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo_white.png',
              scale: 1.5,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 32,
                  ),
                  onPressed: () {
                    launchUrl(
                      urlFacebook,
                    );
                  },
                ),
                const SizedBox(
                  width: 32,
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    size: 32,
                  ),
                  onPressed: () {
                    launchUrl(
                      urlInstagram,
                    );
                  },
                ),
                const SizedBox(
                  width: 32,
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.addressBook,
                    size: 32,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text('Contacts'),
                          content: Column(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
