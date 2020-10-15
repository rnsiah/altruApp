import 'package:flutter/material.dart';
import 'package:altru/API.dart';
import 'package:altru/screens/Atrocity_Screen.dart';


class NonProfitAtrocityShowcase extends StatelessWidget {
  final NonProfit nonProfit;

  NonProfitAtrocityShowcase({this.nonProfit, });

  @override
  Widget build(BuildContext context) {
    PageController pageController;
    var items = <Atrocity>[];
    for (var i = 0; i > nonProfit.atrocity.length; i++) {
      var atrocity = new Atrocity();
      items.add(atrocity);
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: nonProfit.atrocity.length,
        itemBuilder: (context, int index)=> AtrocityCard(
      atrocity: nonProfit.atrocity[index],
      press: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Atrocity_Screen(atrocities:nonProfit.atrocity[index],))),
    )
    );
  }
}




class AtrocityCard extends StatelessWidget {
  final Atrocity atrocity;
  final Function press;

  const AtrocityCard({
    Key key,
    this.atrocity,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
          children:<Widget>[
            Container(
              width: 300,
              height: 135,
              padding: EdgeInsets.all(8),
//        height: 180,
//        width: 160,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)
              ),child: Image.network(atrocity.imageUrl,

              scale: .7,)
              ,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(atrocity.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            ),
          ]
      ),
    );
  }
}