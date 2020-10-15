import 'package:flutter/material.dart';


class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {

    //Update the string as the qr scans


    String qrResult='Not Yet Scanned';
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Now'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Text('Result', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(qrResult, textAlign: TextAlign.center, style: TextStyle(
              fontSize: 18,),
            ),
            SizedBox(height: 20,),
            FlatButton(
              padding: EdgeInsets.all(15),
              onPressed: ()async{

              },
              child: Text('SCAN NOW', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.black, width: 3.0)),
            ),

          ],
        ),
      ),
    );
  }
}
