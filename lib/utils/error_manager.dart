import 'package:familly/screens/molecules/error_modal.dart';
import 'package:flutter/material.dart';

void errorDisplayer(BuildContext context, {String? message}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => ErrorModal(message: message),
  );
}
