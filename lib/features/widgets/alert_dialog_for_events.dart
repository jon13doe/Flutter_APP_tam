import 'package:flutter/material.dart';

class AlertDialogForEvents extends StatefulWidget {
  final String text;
  final String? title;

  const AlertDialogForEvents({
    Key? key,
    required this.text,
    this.title,
  }) : super(key: key);

  @override
  _AlertDialogForEventsState createState() => _AlertDialogForEventsState();
}

class _AlertDialogForEventsState extends State<AlertDialogForEvents> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
       title: widget.title != null ? Text(widget.title!) : null,
      contentPadding: EdgeInsets.zero, // Встановлюємо contentPadding на нуль
      content: Column(
        mainAxisSize:
            MainAxisSize.min, // Встановлюємо розмір Column на мінімальний
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.text),
          ),
        ],
      ),
    );
  }
}
