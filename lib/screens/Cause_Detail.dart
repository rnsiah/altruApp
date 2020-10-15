
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:altru/API.dart';

class Cause_Details extends StatelessWidget {
  final Category category;

  const Cause_Details({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(color: Colors.black,
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back),),

        title: Image(
          image: AssetImage('images/ALTRUE LOGO OFFICIAL.png'),
          height: 30,
          width: 120,
          fit: BoxFit.contain,
        ),
      ),

      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 300,
                          width: 250,
                          decoration: BoxDecoration(
                              image:DecorationImage(fit: BoxFit.contain,
                                  image: NetworkImage(category.image)
                              )),
                        ),
                        Text(category.name ?? '',
                          style: TextStyle(
                            fontSize: 42, fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text('Altrue Cause',style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w300
                        ) ,
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),

                  Divider(color: Colors.black38,),
                  SizedBox(height: 30),
                  RichText(softWrap:true,text: TextSpan(
                      text: category.information,style: TextStyle(fontSize: 20, color: Colors.black54)
                  )),
//                  Text(causes.causeInformation ?? '', style: TextStyle(
//                    fontSize: 20, color: Colors.black45, fontWeight: FontWeight.w500
//                  ),
//                  ),
                  SizedBox(height: 45,),
                  Text('Gallery', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300) ,
                  ),

                  Container(


                    // child: ListView.builder(
                    //   itemCount: ,
                    //   itemBuilder: (context, index) {
                    //   return Card(child: Image.asset(null)
                    //
                    //   );
                    // },),
                  )
                ],
              ),
            ),
//            Positioned(
//              right: -60,
//              child: Container(
//                height: 300,
//                width: 250,
//                decoration: BoxDecoration(
//                    image:DecorationImage(fit: BoxFit.contain,
//                  image: AssetImage(causes.causeImage)
//                )),
//              ),
//            )
          ],
        ),
      ),
    );
  }
}
