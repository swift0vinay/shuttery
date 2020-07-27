import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shuttery/functions/api_functions.dart';
import 'package:shuttery/models/api_fetch.dart';
import 'package:http/http.dart' as http;
import 'package:shuttery/models/curatedModel.dart';
import 'package:shuttery/widgets/gridWallpaper.dart';
import 'package:shuttery/widgets/homepageappbar.dart';
import 'package:shuttery/widgets/searchbar.dart';

class SearchWallpaper extends StatefulWidget {
  String query;
  SearchWallpaper({this.query});
  @override
  _SearchWallpaperState createState() => _SearchWallpaperState(query: query);
}

class _SearchWallpaperState extends State<SearchWallpaper> {
  String query;
  _SearchWallpaperState({this.query});
  List<CuratedModel> searches = List();
  TextEditingController tc = TextEditingController();
  ScrollController sc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      tc.text = query;
    });
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: HomePageAppBar(),
          centerTitle: true,
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
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff5785d),
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: tc,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SearchWallpaper(query: tc.text)));
                          },
                          child: Icon(Icons.search))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<CuratedModel>>(
                  future: getSearchWallpaper(tc.text),
                  builder: (context, ss) {
                    return ss.hasData
                        ? GridWallpaper(list: ss.data)
                        : Center(child: CircularProgressIndicator());
                  },
                )
              ],
            ),
          ),
        ));
  }
}
