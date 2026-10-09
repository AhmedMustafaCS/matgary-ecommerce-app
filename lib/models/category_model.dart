import 'package:matgary/utils/app_assets.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imagePath;
  final int productsCount;

  CategoryModel({required this.id, required this.name, required this.imagePath, required this.productsCount});
}

List<CategoryModel> dummyCategories = [
  CategoryModel(
    id: '1',
    name: 'New Arrivals',
    imagePath: AppAssets.categoryNewArrivals,
    productsCount: 208,
  ),
  CategoryModel(
    id: '2',
    name: 'Clothes',
    imagePath: AppAssets.categoryClothes,
    productsCount: 358,
  ),
  CategoryModel(
    id: '3',
    name: 'Bags',
    imagePath: AppAssets.categoryBags,
    productsCount: 160,
  ),
  CategoryModel(
    id: '4',
    name: 'Shoes',
    imagePath: AppAssets.categoryShoes,
    productsCount: 230,
  ),
  CategoryModel(
    id: '5',
    name: 'Electronics',
    imagePath: AppAssets.categoryElectronics,
    productsCount: 101,
  ),
];
