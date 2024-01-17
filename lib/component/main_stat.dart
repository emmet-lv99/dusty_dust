import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  final String category;
  final String imgPath;
  final String level;
  final String stat;
  final double width;

  const MainStat({
    super.key,
    required this.category,
    required this.imgPath,
    required this.level,
    required this.stat,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.black,
    );
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Text(
            category,
            style: ts,
          ),
          SizedBox(
            height: 8.0,
          ),
          Image.asset(
            imgPath,
            width: 50.0,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            level,
            style: ts,
          ),
          Text(
            stat,
            style: ts,
          ),
        ],
      ),
    );
  }
}
