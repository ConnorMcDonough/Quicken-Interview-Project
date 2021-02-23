import 'dart:convert';

import 'package:quicken_app/data/api.dart';
import 'package:quicken_app/src/data_models/data_model.dart';


class Repository {
  API api = new API();
  List<Data> dataList = [];

  Future<List<Data>> fetchSortedList() async {
    List<dynamic> responseJSON = jsonDecode(await api.fetchRawJSON());

    dataList = responseJSON.map((d) => new Data.fromJson(d)).toList();

    return dataList;
  }
}
