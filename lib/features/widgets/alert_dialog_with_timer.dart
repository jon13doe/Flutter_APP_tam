import 'dart:async';
import 'package:flutter/material.dart';

class AlertDialogWithTimer extends StatefulWidget {
  final String text;
  final int time;

  const AlertDialogWithTimer({
    Key? key,
    required this.text,
    this.time = 5,
  }) : super(key: key);

  @override
  _AlertDialogWithTimerState createState() => _AlertDialogWithTimerState();
}

class _AlertDialogWithTimerState extends State<AlertDialogWithTimer> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: widget.time), () => Navigator.of(context).pop());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero, // Встановлюємо contentPadding на нуль
      content: Column(
        mainAxisSize: MainAxisSize.min, // Встановлюємо розмір Column на мінімальний
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