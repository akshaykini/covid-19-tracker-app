import 'dart:convert';

import 'package:covid19_tracker/Model/stats_model.dart';
import 'package:covid19_tracker/Services/Utilities/app_urls.dart';
import 'package:http/http.dart' as http;

class StatesServices{

  Future<StatsModel> fetchstatsrecord() async{
    final response = await http.get(Uri.parse(AppUrl.worldstatsapi));

    if(response.statusCode == 200) {

      var data = jsonDecode(response.body);
      return StatsModel.fromJson(data);
    }else{
      throw Exception('error');
    }
  }

    Future<List<dynamic>> countrieslistapi() async{
      var data;
    final response = await http.get(Uri.parse(AppUrl.countiesapi));

    if(response.statusCode == 200) {

      data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception('error');
    }
  }
}