import 'package:flutter/material.dart';
import 'package:shuttery/screens/serach_wall.dart';

class SearchBar extends StatelessWidget {
  TextEditingController tc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xff5785d), borderRadius: BorderRadius.circular(20.0)),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: tc,
              decoration: InputDecoration(
                  hintText: "Search Wallpaper", border: InputBorder.none),
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchWallpaper(query:tc.text)));
              },
              child: Icon(Icons.search))
        ],
      ),
    );
  }
}
