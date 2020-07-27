
import 'package:shuttery/models/category_model.dart';

List<CategoryModel> getCategory(){
  List<CategoryModel> categories=new List();
  CategoryModel categoryModel=new CategoryModel();
  categoryModel.category="Food";
  categoryModel.imageUrl='https://images.pexels.com/photos/196643/pexels-photo-196643.jpeg';
  categories.add(categoryModel);

   categoryModel=new CategoryModel();
  categoryModel.category="SeaEscape";
  categoryModel.imageUrl="https://images.pexels.com/photos/1940037/pexels-photo-1940037.jpeg";
  categories.add(categoryModel);

   categoryModel=new CategoryModel();
  categoryModel.category="Nature";
  categoryModel.imageUrl='https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg';
  categories.add(categoryModel);

   categoryModel=new CategoryModel();
  categoryModel.category="Marine";
  categoryModel.imageUrl='https://images.pexels.com/photos/994473/pexels-photo-994473.jpeg';
  categories.add(categoryModel);

   categoryModel=new CategoryModel();
  categoryModel.category="Health";
  categoryModel.imageUrl='https://images.pexels.com/photos/823694/pexels-photo-823694.jpeg';
  categories.add(categoryModel);

  return categories;
}
