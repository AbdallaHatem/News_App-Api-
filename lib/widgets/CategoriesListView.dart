import 'package:flutter/cupertino.dart';
import '../models/Category_Model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
   CategoriesListView({super.key});

   final  List<CategoryModel> categories =  [
   CategoryModel(image:'assets/Business.jpg',CategoryName:'business' ),
   CategoryModel(image:'assets/entertaiment.jpg',CategoryName:'entertainment' ),
     CategoryModel(image:'assets/health.jpg',CategoryName:'health' ),
     CategoryModel(image:'assets/science.jpg',CategoryName:'science' ),
     CategoryModel(image:'assets/sports.jpg',CategoryName:'sports' ),
     CategoryModel(image:'assets/technology.jpeg',CategoryName:'technology' ),
     CategoryModel(image:'assets/general.jpg',CategoryName:'general' ),
   ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context,index)
          {
            return  CategoryCard(
              category: categories[index],
            );
          }
      ),
    );
  }
}
