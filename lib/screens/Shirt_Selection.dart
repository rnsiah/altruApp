import 'package:altru/screens/Product_Detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:altru/API.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ShirtSelection extends StatefulWidget {
  static const String id = 'shirtProductPage';
  @override
  _ShirtSelectionState createState() => _ShirtSelectionState();
}

class _ShirtSelectionState extends State<ShirtSelection> {
  static List<Shirt> _shirt = List<Shirt>();
  static List<Shirt> _shirtsInpp = List<Shirt>();
  Future<List<Shirt>> incomingShirts()async{
    var url = 'http://127.0.0.1:8000/api/shirts';
    var response = await http.get(url);
    var shirts = List<Shirt>();

    if (response.statusCode == 200){
      var shirtsJson = json.decode(response.body);
      for (var shirtJson in shirtsJson){
        shirts.add(Shirt.fromJson(shirtJson));
      }
    }
    return shirts;
  }

  @override
  void initState(){
    incomingShirts().then((value){
      setState(() {
        _shirt.addAll(value);
        _shirtsInpp = _shirt;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=> Navigator.pop(context),color: Colors.black,),
        title: Text('Altrue Tees', style: TextStyle(fontWeight: FontWeight.w900),),
        actions: [
          IconButton(icon: Icon(Icons.search),onPressed: (){},color: Colors.black,),
          IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){},color: Colors.black,),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('Global Causes', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),SizedBox(height: 10,),
//          Categories(),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:2 ),
            child: GridView.builder(
                itemCount: _shirtsInpp.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 27,
                    childAspectRatio: .75,
                    crossAxisCount:2 ),
                itemBuilder: (context, index)=> ProductCard(
              shirt: _shirtsInpp[index],
              press: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Page(shirt:_shirtsInpp[index],))),
            )),
          ),),

        ],
      ),

    );
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


