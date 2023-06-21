import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../core/database/db.provider.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Logout'),
                content: const Text(
                  'You are about to logout',
                  style: TextStyle(fontSize: 20),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => DatabaseProvider().logOut(context),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
        child: const Icon(
          IconlyLight.logout,
          color: Colors.white,
        ));
  }
}
