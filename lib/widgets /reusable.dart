import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReusableChip extends StatelessWidget {
  String label;
  String imageAdress;
  ReusableChip({
    required this.imageAdress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 9, 1, 41),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              child: Image.asset(
                imageAdress,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
