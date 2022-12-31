import 'package:flutter/material.dart';
import 'package:school_app/screens/molecules/error_modal.dart';

void errorDisplayer(BuildContext context, {String? message}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => ErrorModal(message: message),
  );
}
