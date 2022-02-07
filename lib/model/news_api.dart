 import 'dart:convert';

import 'model.dart';
 import 'package:http/http.dart'as http;

class NewsApi{
  String BASE_URL = "https://newsapi.org/v2";
  String key = "e9a6cbcde8f14c2d804f94f8ed4938e7";

  Future<List<News>> getNewsApi(String search,String lan) async{
    String url = "$BASE_URL/top-headlines?country=${Uri.encodeQueryComponent(lan)}&category=${Uri.encodeQueryComponent(search)}&apiKey=$key";
    final response = await http.get(Uri.parse(url));
    print(utf8.decode(response.bodyBytes));

    List<News> data = [];
    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      var res = json.decode(body) as Map<String,dynamic>;
      for(final _res in res["articles"]){
        final m = News.fromJson(_res as Map<String,dynamic>);
        data.add(m);
      }
      return data;
    }else{
      return [];
    }
  }
}