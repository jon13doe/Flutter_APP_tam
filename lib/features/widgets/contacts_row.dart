import 'package:tam_app/global_imports.dart';

class ContactsRow extends StatelessWidget {
  final bool withImg;

  const ContactsRow({super.key, required this.withImg});

  @override
  Widget build(BuildContext context) {
    final Uri urlFacebook =
        Uri.parse('https://www.facebook.com/profile.php?id=100064043010113');
    final Uri urlInstagram =
        Uri.parse('https://instagram.com/teen_age_model_ukraine');
    final List contacts = [
      {
        'name': 'Старостенко Світлана',
        'phone': '546835693',
        'e-mail': 'afdsf@dasda',
      },
      {
        'name': 'Гребенкіна Ірина',
        'phone': '546835693',
        'e-mail': 'afdsf@dasda',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (withImg) Image.asset(
            'assets/logo/logo_white.png',
            scale: 1.5,
          ) else const Text('Contact with us'),
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
                      return AlertDialog(
                        title: const Text('Contacts'),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: contacts.map((contact) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${contact['name']}'),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text('Phone: ${contact['phone']}'),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text('E-mail: ${contact['e-mail']}'),
                                  const Divider(),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}