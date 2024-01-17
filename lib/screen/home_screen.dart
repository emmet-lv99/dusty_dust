import 'package:dusty_dust/component/cartegory_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_drawer.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30,
    );

    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CartegoryCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
