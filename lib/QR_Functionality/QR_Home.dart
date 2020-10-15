import 'QR_Scan.dart';
import 'package:altru/QR_Functionality/QR_Generator.dart';
import 'package:flutter/material.dart';




class myQRHome extends StatefulWidget {
  static const String id = 'qr_screen';
  @override
  _myQRHomeState createState() => _myQRHomeState();
}

class _myQRHomeState extends State<myQRHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Altrue QR'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image(image: AssetImage('images/2 Kids 1 Fish.png'),
              ),
              SizedBox(height: 43),
              flatbutton('Scan Altrue Code', Scan()),
              SizedBox(height: 20,),
              flatbutton('Generate Altrue Code', generate())
            ],
          ),
        ),
      ),


    );
  }

  Widget flatbutton(String text, Widget widget){
    return FlatButton(
      padding: EdgeInsets.all(15),
      onPressed: ()async{
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>widget));
      },
      child: Text(text, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.black, width: 3.0)),
    );
  }
}


