import 'package:altru/screens/Cause_Detail.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:altru/API.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Cause_List extends StatefulWidget {
  static const String id = 'cause_page';
  @override
  _Cause_ListState createState() => _Cause_ListState();

}

class _Cause_ListState extends State<Cause_List> {

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
    return Scaffold(
      appBar: AppBar(title: Image(image: AssetImage('images/ALTRUE LOGO OFFICIAL.png'),height: 30,width: 120,),),
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(32.0) ,
                  child: Column(
                    children: [
                      Text('Causes', style: TextStyle(
                          fontSize: 44, color: Colors.black, fontWeight: FontWeight.w900
                      ),
                        textAlign: TextAlign.left,
                      ),
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'T-Shirts', style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ], onChanged: (value) {  },
                      )
                    ],
                  ),
                ),
                Container(height: 500,
                  padding: const EdgeInsets.only(left:32),
                  child: Swiper(
                    itemCount:_categoriesInApp.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.red,
                        color: Colors.black,
                        activeSize: 20,
                        space: 8,
                      ),
                    ),
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, PageRouteBuilder(
                              pageBuilder: (context,a,b)=> Cause_Details(category: _categoriesInApp[index],)
                          ));
                        },
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                SizedBox(height: 100),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  elevation: 8,
                                  color:Colors.white,child:
                                Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget> [
                                      SizedBox(height:100),
                                      Text(_categoriesInApp[index].name,
                                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600,color: Colors.black),
                                        textAlign: TextAlign.left,),
                                      Text('Altrue Cause',
                                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.left,),
                                      SizedBox(height: 30,),
                                      Row(

                                        children: [
                                          Text('Learn More', textAlign: TextAlign.right, style: TextStyle(color: Colors.red),),
                                          Icon(Icons.arrow_forward, color: Colors.red,)
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                                )
                              ],
                            ),
                            Positioned(top:-17,width: 250, height:250,
                                child: Image.network(_categoriesInApp[index].image
                                ,scale: 2.0,),)
                          ],
                        ),
                      );
                    },

                  ),

                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
