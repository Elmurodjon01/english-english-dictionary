import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 100,
        ),
        Text(
          'Settings',
          style: TextStyle(color: Colors.blueAccent, fontSize: 20),
        )
      ],
    );
  }
}
