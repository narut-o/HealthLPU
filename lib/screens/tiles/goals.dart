import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class GoalTiles extends StatelessWidget {
  String title;

  final IconData next;
  final Color color;

  GoalTiles(
    @required this.title,
    @required this.next,
    @required this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: 180,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Icon(next, size: 35, color: color)
              ],
            ),
            Text(
              '',
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
