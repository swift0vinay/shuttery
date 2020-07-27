import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shuttery/screens/categoty_wall.dart';

class CategoryView extends StatelessWidget {
  final String imageUrl;
  final String category;
  CategoryView({this.imageUrl, this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
            Navigator.push(context,
                    PageRouteBuilder(
                       pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              CategoryWall(categoryName: category,),
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
        child: Center(
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 100,
                  height: 50,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) {
                    return Container(
                      height: 50,
                      width: 100,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                        ),
                      ),
                    );
                  },
                ),
              ),
////              child: Image.network(imageUrl,height: 50,width: 100,fit: BoxFit.fitWidth,)),
              Container(
                height: 50,
                width: 100,
                child: Center(
                    child: Text(
                  category,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
