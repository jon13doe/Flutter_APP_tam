import 'package:flutter/material.dart';
import 'package:tam_app/features/main_screen/contacts_row/contacts_row.dart';
import 'text_pic_column.dart';

class AlertDialogForEvents extends StatefulWidget {
  final String? date;
  final String? title;
  final String text;
  final List<String>? photoUrls;
  final bool? contacts;

  const AlertDialogForEvents({
    Key? key,
    this.date,
    this.title,
    required this.text,
    this.photoUrls,
    this.contacts,
  }) : super(key: key);

  @override
  _AlertDialogForEventsState createState() => _AlertDialogForEventsState();
}

class _AlertDialogForEventsState extends State<AlertDialogForEvents> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title != null ? Text(widget.title!) : null,
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              widget.photoUrls == null
                  ? Text(widget.text)
                  : TextImageColumnWidget(
                      text: widget.text, imagesUrlsList: widget.photoUrls!),
              if (widget.date != null)
                Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.date!,
                        ),
                      ],
                    ),
                  ],
                ),
              if (widget.contacts ?? false)
                const ContactsRow(
                  withImg: false,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
