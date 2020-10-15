import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class generate extends StatefulWidget {
  @override
  _generateState createState() => _generateState();
}

class _generateState extends State<generate> {
  String qrData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image(image: AssetImage('images/ALTRUE LOGO OFFICIAL.png'), height: 100, width: 250,
                fit: BoxFit.contain,
              ),
              QrImage(data:qrData ,),
              SizedBox(height: 10,),
              Text('Generate Your Own Altrue Code'),
              TextField(
                controller: qrText,
                decoration: InputDecoration(
                  hintText: 'Enter Your Preferred Altrue Image Name',
                ),
              ),
              SizedBox(height: 15,),


              FlatButton(
                padding: EdgeInsets.all(15),
                onPressed: ()async{
                  if (qrText.text.isEmpty){
                    qrData='https://Flutter.dev';

                  }
                  else{
                    setState(() {
                      qrData=qrText.text;
                    });

                  }

                },
                child: Text('Generate Altrue Code', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.black, width: 3.0)),
              ),

            ],
          ),
        ),
      ),

    );
  }
  final qrText = TextEditingController();
}