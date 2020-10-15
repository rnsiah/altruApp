import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:altru/API.dart';


class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  int selectedIndex = 0;

  static List<Category> _category = List<Category>();
  static List<Category> _categoriesInApp = List<Category>();
  Future<List<Category>> incomingCategories()async{
    var url = 'http://127.0.0.1:8000/api/categories';
    var response = await http.get(url);
    var categories = List<Category>();

    if (response.statusCode == 200){
      var categoriesJson = json.decode(response.body);
      for (var categoryJson in categoriesJson){
        categories.add(Category.fromJson(categoryJson));
      }
    }
    return categories;
  }

  @override
  void initState(){
    incomingCategories().then((value){
      setState(() {
        _category.addAll(value);
        _categoriesInApp = _category;
      });
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: SizedBox(
        height: 35,
        child: ListView.builder(itemBuilder: (context, index)=>buildCategory(index),
          scrollDirection: Axis.horizontal,
          itemCount: _categoriesInApp.length,
        ),
      ),
    );
  }

  Widget buildCategory(int index){
  return GestureDetector(
    onTap: (){
      setState(() {
        selectedIndex = index;
      });
    },
    child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children:<Widget>[
               Text(
                 _categoriesInApp[index].name, style: TextStyle(fontSize: 22, color: selectedIndex== index? Colors.black : Colors.black26),
               ),
               Container(
                 height: 2,
                 width: 28,
                 color: selectedIndex== index ? Colors.black : Colors.transparent,
                 margin: EdgeInsets.only(top: 1.25 ),
               )
             ]
         ),
       ),
  );
  }
}

  