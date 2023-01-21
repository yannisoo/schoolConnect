import 'package:flutter/material.dart';
import 'package:school_app/config/themes.dart';

class ConfirmModal extends StatelessWidget {
  const ConfirmModal({
    required this.message,
    required this.onConfirm,
    super.key,
  });
  final String message;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Margins.m16),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(Margins.m8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Are you sure ?',
                        style: textStyleLightRed,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          backgroundColor: theme.secondaryHeaderColor,
                          child: const Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: theme.primaryColor,
                  height: Margins.m8,
                  thickness: 1,
                ),
                Text(message),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        onConfirm();
                        Navigator.pop(context);
                      },
                      child: const Text('Confirm'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
