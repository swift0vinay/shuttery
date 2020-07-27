import 'package:shuttery/models/category_model.dart';

List<CategoryModel> getAllCategory() {
  List<CategoryModel> categories = new List();
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.category = "Food";
  categoryModel.imageUrl =
      'https://images.pexels.com/photos/196643/pexels-photo-196643.jpeg';
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "SeaEscape";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/1940037/pexels-photo-1940037.jpeg";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Nature";
  categoryModel.imageUrl =
      'https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg';
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Marine";
  categoryModel.imageUrl =
      'https://images.pexels.com/photos/994473/pexels-photo-994473.jpeg';
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Health";
  categoryModel.imageUrl =
      'https://images.pexels.com/photos/823694/pexels-photo-823694.jpeg';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.category = "Wildlife";
  categoryModel.imageUrl =
      'https://images.pexels.com/photos/572861/pexels-photo-572861.jpeg';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.category = "Cityscape";
  categoryModel.imageUrl =
      'https://images.pexels.com/photos/417344/pexels-photo-417344.jpeg';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.category = "Lifestyle";
  categoryModel.imageUrl =
      'https://images.pexels.com/photos/1807891/pexels-photo-1807891.jpeg';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.category = "Art";
  categoryModel.imageUrl =
      'https://images.pexels.com/photos/3246665/pexels-photo-3246665.png';
  categories.add(categoryModel);
  return categories;
}
