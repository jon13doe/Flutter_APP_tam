import 'package:tam_app/global_imports.dart';
import 'cantact_data.dart';

class ContactsRow extends StatelessWidget {
  final bool withImg;

  const ContactsRow({super.key, required this.withImg});

  @override
  Widget build(BuildContext context) {
    const double icoSize = 32;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (withImg)
            Image.asset(
              'assets/logo/logo_white.png',
              scale: 1.5,
            )
          else
            const Text('Contact with us'),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.facebook,
                  size: icoSize,
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
                  size: icoSize,
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
                  size: icoSize,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Contacts'),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: contacts.map((contact) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${contact['name']}'),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text('Phone: ${contact['phone']}'),
                                      IconButton(
                                        icon: const Icon(Icons.phone),
                                        onPressed: () async {
                                          final phoneUrl = Uri(
                                            scheme: 'tel',
                                            path: contact['phone'] ?? '',
                                          );
                                          if (await canLaunchUrl(
                                              Uri.parse('$phoneUrl'))) {
                                            await launchUrl(
                                              Uri.parse('$phoneUrl'),
                                              mode: LaunchMode.platformDefault,
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.message),
                                        onPressed: () async {
                                          final String telegramUrl =
                                              'tg://msg??to=+${contact['phone']}';
                                          if (await canLaunchUrl(
                                              Uri.parse(telegramUrl))) {
                                            await launchUrl(
                                              Uri.parse(telegramUrl),
                                              mode: LaunchMode.platformDefault,
                                            );
                                          }
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.chat_bubble),
                                        onPressed: () async {
                                          final String viberUrl =
                                              'viber://chat?number=${contact['phone']}';
                                          if (await canLaunchUrl(
                                              Uri.parse(viberUrl))) {
                                            await launchUrl(
                                              Uri.parse(viberUrl),
                                              mode: LaunchMode.platformDefault,
                                            );
                                          }
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.email),
                                        onPressed: () async {
                                          final url = Uri(
                                            scheme: 'mailto',
                                            path: contact['email'],
                                          );
                                          String emailUrl = url.toString();
                                          if (await canLaunchUrl(
                                              Uri.parse(emailUrl))) {
                                            await launchUrl(
                                              Uri.parse(emailUrl),
                                              mode: LaunchMode.platformDefault,
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
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
