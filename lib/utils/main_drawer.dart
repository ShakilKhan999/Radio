import 'package:flutter/material.dart';


class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ListView(
        children: [
          ListTile(
            onTap: () async {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.cancel_sharp),
          ),
        ],
      ),
    );
  }
}
