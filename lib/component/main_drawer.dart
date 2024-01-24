import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/regions.dart';

typedef OnRegionTap = void Function(String region);

class MainDrawer extends StatelessWidget {
  final OnRegionTap onRegionTap;
  final String selectedRegion;

  const MainDrawer({
    super.key,
    required this.selectedRegion,
    required this.onRegionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              '지역선택',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          ...regions
              .map(
                (e) => ListTile(
                  onTap: () {
                    onRegionTap(e);
                  },
                  title: Text(e),
                  selectedTileColor: lightColor,
                  selectedColor: Colors.black,
                  selected: e == selectedRegion,
                  tileColor: Colors.white,
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
