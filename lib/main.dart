import 'package:altru/QR_Functionality/QR_Home.dart';
import 'package:altru/screens/AtrocityList.dart';
import 'package:altru/screens/Auth_Page.dart';
import 'package:altru/screens/Cause_List.dart';
import 'package:altru/screens/LoginPage.dart';
import 'package:altru/screens/NonProfit_Screen2.dart';
import 'package:altru/screens/SignUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:altru/screens/HomeScreen.dart';
import 'package:altru/screens/Shirt_Selection.dart';
import 'package:altru/screens/Atrocity_Video.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: UserHomePage.id,
      routes: {
        Cause_List.id:(context)=>Cause_List(),
        myQRHome.id:(context)=>myQRHome(),
        ShirtSelection.id:(context)=>ShirtSelection(),
        NonProfitScreen.id:(context)=>NonProfitScreen(),



      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:SignUp(),
    );
  }
}


