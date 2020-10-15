import 'package:flutter/material.dart';
import 'package:altru/API.dart';
import 'package:altru/screens/Product_Detail_Screen.dart';

class NonProfitShirtShowcase extends StatelessWidget {
  final NonProfit nonProfit;

  NonProfitShirtShowcase({this.nonProfit});
  @override
  Widget build(BuildContext context) {
    var items= <Shirt>[];
    for (var i = 0; i> nonProfit.shirtList.length; i++){
      var shirt = new Shirt();
      items.add(shirt);
    }
  return  GridView.builder(
      itemCount: nonProfit.shirtList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 18,
          crossAxisSpacing: 27,
          childAspectRatio: .75,
          crossAxisCount:2 ),
      itemBuilder: (context, index)=> ProductCard(
        shirt: nonProfit.shirtList[index],
        press: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Page(shirt:nonProfit.shirtList[index],))),
      ));
  }
}







class ProductCard extends StatelessWidget {
  final Shirt shirt;
  final Function press;

  const ProductCard({
    Key key,
    this.shirt,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
          children:<Widget>[
            Container(
              padding: EdgeInsets.all(8),
//        height: 180,
//        width: 160,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)
              ),child: Image.network(shirt.shirtImage,

              scale: .7,)
              ,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(shirt.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            ),Text(shirt.price.toString(), style: TextStyle(fontWeight: FontWeight.bold),)
          ]
      ),
    );
  }
}