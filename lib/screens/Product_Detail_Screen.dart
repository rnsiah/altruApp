import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:altru/API.dart';
import 'package:altru/screens/Shirt_Selection.dart';

class Product_Page extends StatelessWidget {
  final Shirt shirt;

  const Product_Page({Key key, this.shirt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
        Image.network(shirt.originalImage),
        Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          centerTitle: true,
          title: Image(fit:BoxFit.contain,image: AssetImage('images/Altrue Logo White.png',) ,
          ),
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=>Navigator.pop(context),color: Colors.white,
          ),
          actions: [
            SizedBox(width: 4,),
            IconButton(icon: Icon(Icons.search), onPressed: (){}, color: Colors.white,),
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){}, color: Colors.white,),
          ],
        ),
        body: Body(shirt:shirt),
      ),
    ]);
  }
}

class Body extends StatelessWidget {
  final Shirt shirt;

  const Body({Key key, this.shirt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SizedBox(height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * .3),
                  padding: EdgeInsets.only(top: size.height * .12, left: 12, right: 12),
                  height:700,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(children:<Widget>[
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Color:', style: TextStyle(color: Colors.amber),),
                            Row(children: [
                              ColorDot(color: Colors.black,),
                              ColorDot(color: Colors.white, isSelected: true,),
                              ColorDot(color: Colors.amber,),
                            ],
                            )
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    style: TextStyle(color: Colors.amber),
                                    text: 'Size'
                                )
                              ]
                          ),
                        ),

                      ],
                      )
                    ],
                  ),
                ),
                ProductWithTitleView(shirt: shirt)
              ],
            ),)

        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 12,
          right: 24
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: isSelected ? color:Colors.white),
      ),child: DecoratedBox(decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
    )),

    );
  }
}

class ProductWithTitleView extends StatelessWidget {
  const ProductWithTitleView({
    Key key,
    @required this.shirt,
  }) : super(key: key);

  final Shirt shirt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:12),
          Text('Premium Cotton Tee', style:TextStyle(color: Colors.white, fontSize: 18),),
          Text(shirt.name,style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          ColorAndSize(shirt: shirt)
        ],),
    );
  }
}

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.shirt,
  }) : super(key: key);

  final Shirt shirt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
              children: [
                TextSpan(text: 'Price\n', style: TextStyle(color: Colors.amber),
                ),
                TextSpan(text: '\$${shirt.price}',
                  style:TextStyle(fontSize: 24, color: Colors.amber), )
              ]
          ),
        ),
        SizedBox(width: 3),
        Expanded(child: Image.network(shirt.shirtImage, fit: BoxFit.fill),)
      ],);
  }
}
