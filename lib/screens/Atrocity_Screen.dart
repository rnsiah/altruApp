import 'package:altru/Widgets/Content_Scroll.dart';
import 'package:altru/category_model.dart';
import 'package:altru/screens/Atrocity_Video.dart';
import 'package:altru/screens/Cause_Detail.dart';
import 'package:flutter/material.dart';
import 'package:altru/API.dart';
import 'package:altru/Widgets/Cicular_Clipper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Atrocity_Screen extends StatefulWidget {
  final Atrocity atrocities;

  Atrocity_Screen({this.atrocities});

  @override
  _Atrocity_ScreenState createState() => _Atrocity_ScreenState();
}

class _Atrocity_ScreenState extends State<Atrocity_Screen> {


  _launchURL() async {
     var url = widget.atrocities.videoURL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50, 0.0),
                child: Hero(
                  tag: widget.atrocities.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.atrocities.imageUrl),
                    ),

                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left:30),
                    onPressed: ()=> Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                  Image(image:AssetImage('images/Altrue Logo White.png'),
                    fit: BoxFit.scaleDown,
                    height: 60,
                    width: 150,),
                  IconButton(
                    padding: EdgeInsets.only(left:20),
                    onPressed: ()=> print('Add to favorites'),
                    icon: Icon(Icons.favorite),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    elevation: 12.0,
                    padding: EdgeInsets.all(10),
                    onPressed: _launchURL,
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0, left: 20.0,
                child: IconButton(
                  onPressed: ()=> print("I'm Sharing This"),
                  icon: Icon(Icons.share),
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0.0, right: 25.0,
                child: IconButton(
                  onPressed: ()=> print("I'm adding This to my list"),
                  icon: Icon(Icons.add),
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Image(image:AssetImage(widget.atrocities.country.flag), width: 200, height: 150,),
                Text('REGION:' + widget.atrocities.region.toUpperCase()),
                SizedBox(height:6),
                Text(
                  widget.atrocities.title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.atrocities.info,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
               //  Expanded(
               //    child: ListView.builder(itemCount: widget.atrocities.category.length,
               //      itemBuilder: (context, index)=>CategoryCard(
               //        category:widget.atrocities.category[index],
               //        press: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Cause_Details(category:widget.atrocities.category[index]))),
               //      ),
               // ),
               //  )



              ],

            ),
          )
        ],
      ),

    );
  }
}


class CategoryCard extends StatelessWidget {
  final Category category;
  final Function press;

  const CategoryCard({
    Key key,
    this.category,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
          children:<Widget>[
            Container(
              height: 400,
              width: 400,
              padding: EdgeInsets.all(8),
//        height: 180,
//        width: 160,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)
              ),child: Image.network(category.image,

              scale: .7,)
              ,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(category.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            ),

          ]
      ),
    );
  }
}


