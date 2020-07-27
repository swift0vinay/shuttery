import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SetWallpaper extends StatefulWidget {
  String url;
  int id;
  SetWallpaper({this.url, this.id});
  @override
  _SetWallpaperState createState() => _SetWallpaperState(url: url, id: id);
}

class _SetWallpaperState extends State<SetWallpaper> {
  String url;
  int id;
  bool downloaded;
  _SetWallpaperState({this.url, this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: url,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    downloadImage(url, id);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.white),
                        gradient: LinearGradient(
                            colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)])),
                    child: Center(
                        child: Text("SET WALLPAPER",
                            style: TextStyle(
                                fontSize: 20, color: Colors.white70))),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.white),
                          gradient: LinearGradient(
                              colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)])),
                      child: Center(
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> downloadImage(String url, int id) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final Directory myDir = Directory('${directory.path}/downloads');
    String path = '';
    if (await myDir.exists()) {
      //if folder already exists return path
      path = myDir.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder = await myDir.create(recursive: true);
      path = myDir.path;
    }
    String myp = '$path/$id.jpeg';
    Dio dio = new Dio();
    dio.download(url, myp, onReceiveProgress: (r, t) {
      setState(() {
        var totalDownload = ((r / t) * 100).floorToDouble();
        if (totalDownload == 100.0) {
          setState(() {
            downloaded = true;
          });
        }
      });
    });
  }

  // static const platform = const MethodChannel('wallpaper');
  // Future<void> _getWallpaper(String path) async {
  //   try {
  //     final int res =
  //         await platform.invokeMethod('getWallpaper', {'text', path});
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
