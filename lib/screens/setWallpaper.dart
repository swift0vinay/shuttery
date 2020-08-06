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
  String _setWallpaper = '';
  _SetWallpaperState({this.url, this.id});
  final key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
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
    var dir = await getTemporaryDirectory();
    String myp = '${dir.path}/$id.jpeg';
    Dio dio = new Dio();
    print(myp);
    await dio.download(url, myp, onReceiveProgress: (r, t) {
      setState(() {
        var totalDownload = ((r / t) * 100).floorToDouble();
        print(totalDownload);
        if (totalDownload == 100.0) {
          setState(() {
            downloaded = true;
          });
        }
      });
    });
    if (downloaded) {
      _getWallpaper(id);
    }
  }

  static const platform = const MethodChannel('com.example.shuttery/wallpaper');
  Future<void> _getWallpaper(int id) async {
    String setWallpaper = '';
    try {
      print('path is $id');
      final int res = await platform.invokeMethod('setWallpaper', '$id.jpeg');
      setWallpaper = " Wallpaer Updated.. ";
    } on PlatformException catch (e) {
      setWallpaper = "Failed to Set Wallpaer: '${e.message}'.";
    }
    setState(() {
      _setWallpaper = setWallpaper;
    });
    key.currentState.showSnackBar(SnackBar(
      content: Text(_setWallpaper),
    ));
  }
}
