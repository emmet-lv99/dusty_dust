import 'package:dio/dio.dart';
import 'package:dusty_dust/model/stat_model.dart';

import '../const/data.dart';

class StatRepository {
  static Future<List<StatModel>> fetchData({
    required ItemCode itemdCode,
  }) async {
    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey': serviceKey,
        'returnType': 'json',
        'numOfRows': 30,
        'pageNo': 1,
        'itemCode': itemdCode.name,
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK',
      },
    );
    return response.data['response']['body']['items']
        .map<StatModel>(
          (item) => StatModel.fromJson(json: item),
        )
        .toList();
  }
}
