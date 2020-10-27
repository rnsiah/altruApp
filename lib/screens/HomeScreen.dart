import 'dart:math';

import 'package:altru/screens/Atrocity_Screen.dart';
import 'package:altru/screens/Cause_List.dart';
import 'package:altru/screens/NonProfit_Screen2.dart';
import 'package:altru/QR_Functionality/QR_Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:altru/API.dart';
import 'package:http/http.dart' as http;
import 'package:altru/Widgets/Cicular_Clipper.dart';
import 'package:altru/Widgets/Content_Scroll.dart';
import 'dart:convert';
import 'package:altru/screens/NonProfit_Screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:altru/bloc_login/bloc/authentication_bloc.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
  static const String id = 'User_Home_Screen';
}

class _UserHomePageState extends State<UserHomePage> {

  PageController _pageController;

  static List<Atrocity> _featuredAtrocity = List<Atrocity>();
  static List<Atrocity> _featuredAtrocitiesInApp = List<Atrocity>();
  Future<List<Atrocity>> incomingFeaturedAtrocities()async {
    var url = 'http://127.0.0.1:8000/api/featuredatrocities';
    var response = await http.get(url);
    var featuredAtrocities = List<Atrocity>();

    if (response.statusCode == 200) {
      var atrocitiesjson = json.decode(response.body);
      for (var atrocityjson in atrocitiesjson) {
        featuredAtrocities.add(Atrocity.fromJson(atrocityjson));
      }
    }
    return featuredAtrocities;
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    // TODO: implement initState
    incomingFeaturedAtrocities().then((value){
      setState(() {
        _featuredAtrocity.addAll(value);
        _featuredAtrocitiesInApp=_featuredAtrocity;
      });

    });
    super.initState();
  }

  _shirtSelector(int index){
    return AnimatedBuilder(animation: _pageController, builder: (BuildContext context, Widget widget){
      double value = 1;
      if (_pageController.position.haveDimensions){
        value = _pageController.page - index;
        value = (1 - (value.abs() * 0.3) + 0.6).clamp(0.0, 1.0);
      }
      return Center(child: SizedBox(
        height: Curves.easeInOut.transform(value) * 270.0,
        width: Curves.easeInOut.transform(value) * 400,
        child: widget,


      ),
      );
    },
      // This section is coded for the Top part of UI- The Atrocity List can be populated from the atrocity class
      //This section shows all the new atrocities going on in the world in real time
      child: GestureDetector(
        onTap: ()=> Navigator.push(
            context, MaterialPageRoute(
            builder: (_) => Atrocity_Screen(atrocities: _featuredAtrocitiesInApp[index],)
        )),
        child: Stack(children: <Widget>[
          Center(child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 4.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Center(child: Hero(tag: _featuredAtrocitiesInApp[index].imageUrl,
              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Image(image: NetworkImage(_featuredAtrocitiesInApp[index].imageUrl),
                  height: 220.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ),

          ),),
          Positioned(
            left: 30,
            bottom: 40,
            child: Text(_featuredAtrocitiesInApp[index].title.toUpperCase(), style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800
            ),
            ),
          )
        ],),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45.0,
                    backgroundImage: null,
                  ),
                  Text('Name'),
                  Text('@Username')
                ],
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.black),
                title: Text('My Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                onTap: ()=> print('Taking You to my profile page'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.black),
                title: Text('My Causes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                onTap: ()=> print('Taking You to my causes page'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.camera, color: Colors.black),
                title: Text('My Altrue Code', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                onTap: (){

                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>myQRHome()
                    )
                    );
                  });
                },
              ),
            ),
            Card(color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.close, color: Colors.amber),
              title: Text('Sign Out Now', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),onTap: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(LoggedOut());
            },
            ),)
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image(
          image: AssetImage('images/ALTRUE LOGO OFFICIAL.png'),
          height: 30,
          width: 120,
          fit: BoxFit.contain,

        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 18),
          onPressed: ()=> print('Menu'),
          icon: Icon(Icons.menu),
          iconSize: 30,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 18),
            onPressed: ()=> print('Search'),
            icon: Icon(Icons.search),
            iconSize: 30,
            color: Colors.black,
          ),

        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _featuredAtrocitiesInApp.length,
              itemBuilder: (BuildContext context, int index){
                return _shirtSelector(index);
              },
            ),
          ),
          Container(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pageLabels.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, pageLabels[index].route);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.black12]
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(pageLabels[index].label.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ContentScroll(images:newShirts, title: "Altrue's Collection Of The Week", imageHeight: 300, imageWidth: 150.0),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, NonProfitScreen.id),
            child: Container(width: 300, height: 80,
              color: Colors.amber,
              child: Positioned(
                  left: 50,
                  child: Text('Non Profits',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),)),
            ),
          )
        ],
      ),
    );
  }
}
