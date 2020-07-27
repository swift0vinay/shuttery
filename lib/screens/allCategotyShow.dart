import 'package:flutter/material.dart';
import 'package:shuttery/categories/data.dart';
import 'package:shuttery/functions/api_functions.dart';
import 'package:shuttery/models/curatedModel.dart';
import 'package:shuttery/widgets/gridWallpaper.dart';

class AllCategoryShow extends StatefulWidget {
  String category;
  AllCategoryShow({this.category});
  @override
  _AllCategoryShowState createState() =>
      _AllCategoryShowState(category: category);
}

class _AllCategoryShowState extends State<AllCategoryShow> {
  String category;
  _AllCategoryShowState({this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(category),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder<List<CuratedModel>>(
              future: getCategoryWallpapers(category),
              builder: (context, ss) {
                return ss.hasData
                    ? GridWallpaper(list: ss.data)
                    : Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
