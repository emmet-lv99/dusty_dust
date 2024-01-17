import 'package:flutter/material.dart';

import '../const/colors.dart';
import 'main_stat.dart';

class CartegoryCard extends StatelessWidget {
  const CartegoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        color: lightColor,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '종류별 통계',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    20,
                    (index) => MainStat(
                      category: '미세먼지$index',
                      imgPath: 'asset/img/best.png',
                      level: '최고',
                      stat: '0',
                      width: constraints.maxWidth / 3,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
