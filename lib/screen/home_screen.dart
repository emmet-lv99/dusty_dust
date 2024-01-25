import 'package:dusty_dust/component/cartegory_card.dart';
import 'package:dusty_dust/component/hourly_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_drawer.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/const/regions.dart';
import 'package:dusty_dust/const/status_level.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/repository/stat_repository.dart';
import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String region = regions[0];

  Future<Map<ItemCode, List<StatModel>>> fetchData() async {
    Map<ItemCode, List<StatModel>> stats = {};

    List<Future> futures = [];

    for (ItemCode itemCode in ItemCode.values) {
      futures.add(
        StatRepository.fetchData(
          itemdCode: itemCode,
        ),
      );
    }

    final results = await Future.wait(futures);

    for (int i = 0; i < results.length; i++) {
      final key = ItemCode.values[i];
      final value = results[i];

      stats.addAll({
        key: value,
      });
    }

    return stats;
  }

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30,
    );

    return Scaffold(
      drawer: MainDrawer(
        selectedRegion: region,
        onRegionTap: (String region) {
          setState(() {
            this.region = region;
            Navigator.of(context).pop();
          });
        },
      ),
      backgroundColor: primaryColor,
      body: FutureBuilder<Map<ItemCode, List<StatModel>>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('에러가 있습니다.'),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final stats = snapshot.data!;
          StatModel pm10RecentStat = stats[ItemCode.PM10]![0];
          final StatusModel status = DataUtils.getStatusFromItemCodeAndValue(
            value: pm10RecentStat.seoul,
            itemCode: ItemCode.PM10,
          );

          return CustomScrollView(
            slivers: [
              MainAppBar(
                region: region,
                stat: pm10RecentStat,
                status: status,
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CartegoryCard(),
                    const SizedBox(height: 16),
                    HourlyCard(),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
