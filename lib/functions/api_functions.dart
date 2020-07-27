import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shuttery/models/api_fetch.dart';
import 'package:shuttery/models/curatedModel.dart';

Future<List<CuratedModel>> getTrendingWallpaper() async {
  List<CuratedModel> curatedmodels = new List();
  String url = "https://api.pexels.com/v1/curated?per_page=16";
  var response = await http.get(url, headers: {"Authorization": apiKey});
  // print(response.body.toString());
  Map<String, dynamic> jsonData = jsonDecode(response.body);
//  List<dynamic> list=jsonData["photos"];
  jsonData["photos"].forEach((element) {
//      print(element);
    CuratedModel curatedModel = new CuratedModel();
    curatedModel = CuratedModel.fromMap(element);
    curatedmodels.add(curatedModel);
  });
  return curatedmodels;
}

Future<List<CuratedModel>> getCategoryWallpapers(String category) async {
  List<CuratedModel> categories = new List();

  String url = "https://api.pexels.com/v1/search?query=$category&per_page=16";
  var response = await http.get(url, headers: {"Authorization": apiKey});
  print(response.body.toString());
  Map<String, dynamic> jsonData = jsonDecode(response.body);
//  List<dynamic> list=jsonData["photos"];
  jsonData["photos"].forEach((element) {
//      print(element);
    CuratedModel curatedModel = CuratedModel.fromMap(element);
    categories.add(curatedModel);
  });
  return categories;
}

Future<List<CuratedModel>> getSearchWallpaper(String query) async {
  List<CuratedModel> searches = new List();

  String url = "https://api.pexels.com/v1/search?query=$query&per_page=16";
  var response = await http.get(url, headers: {"Authorization": apiKey});
  print(response.body.toString());
  Map<String, dynamic> jsonData = jsonDecode(response.body);
//  List<dynamic> list=jsonData["photos"];
  jsonData["photos"].forEach((element) {
//      print(element);
    CuratedModel curatedModel = CuratedModel.fromMap(element);
    searches.add(curatedModel);
  });
  return searches;
}
