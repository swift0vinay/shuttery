import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shuttery/categories/data.dart';
import 'package:http/http.dart' as http;
import 'package:shuttery/functions/api_functions.dart';
import 'package:shuttery/models/curatedModel.dart';
import 'package:shuttery/widgets/gridWallpaper.dart';

class CategoryWall extends StatefulWidget {
  final String categoryName;
  CategoryWall({this.categoryName});
  @override
  _CategoryWallState createState() =>
      _CategoryWallState(categoryName: categoryName);
}

class _CategoryWallState extends State<CategoryWall> {
  // int load = 16;
  // bool start = false;
  final String categoryName;
  // ScrollController sc;
  _CategoryWallState({this.categoryName});
  @override
  void initState() {
    super.initState();
    // sc = new ScrollController();
  }

  @override
  void dispose() {
    // sc.dispose();
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            categoryName,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder<List<CuratedModel>>(
                future: getCategoryWallpapers(categoryName),
                builder: (context, ss) {
                  return ss.hasData
                      ? GridWallpaper(list: ss.data)
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ));
  }
}
