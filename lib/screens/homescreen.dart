import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shuttery/categories/data.dart';
import 'package:http/http.dart' as http;
import 'package:shuttery/functions/api_functions.dart';
import 'package:shuttery/models/api_fetch.dart';
import 'package:shuttery/models/category_model.dart';
import 'package:shuttery/models/curatedModel.dart';
import 'package:shuttery/screens/allCategories.dart';
import 'package:shuttery/screens/setWallpaper.dart';
import 'package:shuttery/widgets/gridWallpaper.dart';
import 'package:shuttery/widgets/homepageappbar.dart';
import 'package:shuttery/widgets/horizontal_list.dart';
import 'package:shuttery/widgets/searchbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: HomePageAppBar(),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.lightbulb_outline,
                color: Colors.yellow,
              ),
              onPressed: () {},
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SearchBar(),
              categoryBar(),
              buildList(),
              bottomBar(),
            ],
          ),
        ));
  }

  FutureBuilder<List<CuratedModel>> buildList() {
    return FutureBuilder<List<CuratedModel>>(
      future: getTrendingWallpaper(),
      builder: (context, ss) {
        return ss.hasData
            ? GridWallpaper(list: ss.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Container categoryBar() {
    return Container(
      // color: Colors.amber,
      height: 70,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length + 1,
          itemBuilder: (context, i) {
            if (i < categories.length) {
              print("LITST ITEM IS ${categories[i].imageUrl}");
              return CategoryView(
                imageUrl: categories[i].imageUrl,
                category: categories[i].category,
              );
            } else {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                        ) =>
                            AllCategory(),
                        transitionsBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child,
                        ) =>
                            SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            }
          }),
    );
  }

  bottomBar() {
    return Center(
      child: Container(
        height: 30,
        width: MediaQuery.of(context).size.width-20,
        child: Center(child: Text("Designed With \u2665 by Vinay",style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
