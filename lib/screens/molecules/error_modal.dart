import 'package:familly/config/themes.dart';
import 'package:flutter/material.dart';

class ErrorModal extends StatelessWidget {
  const ErrorModal({
    this.message,
    super.key,
  });
  final String? message;

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
                        'Error',
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
                Text(message ?? 'An unexcepted error occured'),
              ],
            ),
          ),
        ),
      );
}
