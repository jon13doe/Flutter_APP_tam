import 'package:flutter/material.dart';

class TextImageColumnWidget extends StatelessWidget {
  final String text;
  final List<String> imagesUrlsList;

  const TextImageColumnWidget({
    super.key,
    required this.text,
    required this.imagesUrlsList,
  });

  @override
  Widget build(BuildContext context) {
    List<String> paragraphs = text.split('\n');

    List<Widget> widgets = [];

    for (int i = 0; i < paragraphs.length; i++) {
      widgets.add(
        Text(
          paragraphs[i],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      widgets.add(Image.network(imagesUrlsList[i]));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
