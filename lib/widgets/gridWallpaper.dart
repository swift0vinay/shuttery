import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttery/models/curatedModel.dart';
import 'package:shuttery/screens/setWallpaper.dart';

class GridWallpaper extends StatefulWidget {
  List<CuratedModel> list;
  GridWallpaper({this.list});
  @override
  _GridWallpaperState createState() => _GridWallpaperState(list: list);
}

class _GridWallpaperState extends State<GridWallpaper> {
  List<CuratedModel> list;
  _GridWallpaperState({this.list});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: GridView.count(
        primary: true,
        crossAxisCount: 2,
        childAspectRatio: 0.60,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(list.length, (index) {
          return getCell(list[index]);
        }),
      ),
    );
  }

  Widget getCell(CuratedModel curatedModel) {
    return GridTile(
      child: Container(
        // color: Colors.amber,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SetWallpaper(url: curatedModel.src.portrait)));
          },
          child: Hero(
            tag: curatedModel.src.portrait,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                // width: 50,
                imageUrl: curatedModel.src.portrait,
                placeholder: (context, url) {
                  return Container(
                    child: Center(
                      child: Image.asset(
                        "images/icon.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
