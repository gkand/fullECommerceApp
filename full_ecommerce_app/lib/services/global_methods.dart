import 'package:flutter/material.dart';

class GlobalMethods {
  Future<void> showDialogue(BuildContext context, VoidCallback callBack) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('All itemswill be deleted!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
                onPressed: () {
                  callBack();
                  Navigator.pop(context);
                },
                child: const Text('Yes')),
          ],
        );
      },
    );
  }
}
