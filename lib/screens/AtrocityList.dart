import 'dart:convert';

import 'package:altru/screens/Atrocity_Screen.dart';
import 'package:flutter/material.dart';
import 'package:altru/API.dart';
import 'package:http/http.dart' as http;


class Atrocity_List extends StatefulWidget {
  @override
  _Atrocity_ListState createState() => _Atrocity_ListState();
}

class _Atrocity_ListState extends State<Atrocity_List> {

  static List<Atrocity> _atrocity = List<Atrocity>();
  static List<Atrocity> _atrocitiesInApp = List<Atrocity>();
  Future<List<Atrocity>> incomingAtrocities()async{
    var url = 'http://127.0.0.1:8000/api/atrocities';
    var response = await http.get(url);
    var atrocities = List<Atrocity>();

    if (response.statusCode == 200){
      var categoriesJson = json.decode(response.body);
      for (var categoryJson in categoriesJson){
        atrocities.add(Atrocity.fromJson(categoryJson));
      }
    }
    return atrocities;
  }
  @override
  void initState() {
    incomingAtrocities().then((value){
      setState(() {
        _atrocity.addAll(value);
        _atrocitiesInApp = _atrocity;
      });
    });
    // TODO: implement initState
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
            child: ListView.builder(
                itemCount: _atrocitiesInApp.length,
                itemBuilder: (context, index)=> AtrocityCard(
                  atrocity: _atrocitiesInApp[index],
                  press: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Atrocity_Screen(atrocities:_atrocitiesInApp[index],))),
                )),
          ),),

        ],
      ),

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


