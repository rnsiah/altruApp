import 'dart:convert';
import 'package:altru/Widgets/CategorySelector.dart';
import 'package:altru/screens/NonProfit_Detail.dart';
import 'package:flutter/material.dart';
import 'package:altru/API.dart';
import 'package:http/http.dart' as http;


class NonProfitScreen extends StatefulWidget {
  static const String id= 'nonProfitListPage';
  @override
  _NonProfitScreenState createState() => _NonProfitScreenState();
}

class _NonProfitScreenState extends State<NonProfitScreen> {

  static List<NonProfit> _nonProfit = List<NonProfit>();
  static List<NonProfit> _nonProfitsInApp = List<NonProfit>();
  Future<List<NonProfit>> incomingNonProfits()async{
    var url = 'http://127.0.0.1:8000/api/nonprofits';
    var response = await http.get(url);
    var nonprofits = List<NonProfit>();

    if (response.statusCode == 200){
      var nonProfitsJson = json.decode(response.body);
      for (var nonProfitJson in nonProfitsJson){
        nonprofits.add(NonProfit.fromJson(nonProfitJson));
      }
    }
    return nonprofits;
  }

  @override
  void initState(){
    incomingNonProfits().then((value){
      setState(() {
        _nonProfit.addAll(value);
        _nonProfitsInApp = _nonProfit;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Image( image: AssetImage('images/Altrue_Logo_W.png'),
          height: 30,
          width: 120,
          fit: BoxFit.contain,
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context), color: Colors.white),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('Global Causes', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10,),
            CategoryList(),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:2 ),
              child: GridView.builder(
                  itemCount: _nonProfitsInApp.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 27,
                      childAspectRatio: .75,
                      crossAxisCount:2 ),  itemBuilder: (context, index)=> NonProfitCard(
                nonProfit: _nonProfitsInApp[index],

             press: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NonProfitDetailScreen(nonProfit: _nonProfitsInApp[index],)
             )
             ),
              )),
            ),),
          ],
      )
      );
  }
}



class NonProfitCard extends StatelessWidget {
  final NonProfit nonProfit;
  final Function press;

  const NonProfitCard({
    Key key,
    this.nonProfit,
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
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)
              ),child: Image.network(nonProfit.logo, width: 130, height: 130, fit: BoxFit.fitWidth,),

              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(nonProfit.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            ),
          ]
      ),
    );
  }
}
