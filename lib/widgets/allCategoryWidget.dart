import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shuttery/categories/allCategoriesData.dart';
import 'package:shuttery/models/category_model.dart';
import 'package:shuttery/screens/allCategotyShow.dart';

class AllCategoryBuilder extends StatefulWidget {
  @override
  _AllCategoryBuilderState createState() => _AllCategoryBuilderState();
}

class _AllCategoryBuilderState extends State<AllCategoryBuilder> {
  List<CategoryModel> list = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: GridView.count(
            primary: true,
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: List.generate(list.length, (index) {
              return genCell(list[index]);
            })));
  }

  Widget genCell(CategoryModel categoryModel) {
    return GridTile(
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>AllCategoryShow(category:categoryModel.category)
            ));
          },
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  // width: 50,
                  imageUrl: categoryModel.imageUrl,
                  placeholder: (context, url) {
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
              Container(
                height: 200,
                width: 200,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(categoryModel.category,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
