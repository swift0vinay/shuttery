import 'package:flutter/material.dart';
import 'package:shuttery/widgets/allCategoryWidget.dart';


class AllCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'All Categories',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: AllCategoryBuilder(),
    );
  }
}
