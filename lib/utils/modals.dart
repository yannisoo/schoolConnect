import 'package:flutter/material.dart';
import 'package:school_app/screens/molecules/confirm_modal.dart';
import 'package:school_app/screens/molecules/error_modal.dart';

void errorModal(BuildContext context, {String? message}) {
  showModalBottomSheet<ErrorModal>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => ErrorModal(message: message),
  );
}

void confirmModal(
  BuildContext context, {
  required String message,
  required VoidCallback onConfirm,
}) {
  showModalBottomSheet<ConfirmModal>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => ConfirmModal(message: message, onConfirm: onConfirm),
  );
}

Future<TimeOfDay?> selectTime(
  BuildContext context,
  TimeOfDay initialTime,
) async =>
    showTimePicker(
      context: context,
      initialTime: initialTime,
    );
Future<DateTime?> selectDay(
  BuildContext context, {
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) async =>
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
