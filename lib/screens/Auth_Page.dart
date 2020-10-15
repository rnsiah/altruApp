import 'package:altru/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types



class authPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/altrue homepage background.png'),
            )

        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Welcome to Altrue Global',
                  style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.people),
                    focusColor: Colors.white,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    labelText: 'Enter Your Username or Email',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    filled: true,



                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock
                    ),
                    focusColor: Colors.white,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    labelText: 'Enter Your Username or Email',
                    labelStyle: TextStyle(color: Colors.redAccent),
                    filled: true,



                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RaisedButton(
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),

                        onPressed: ()=>{},
                        child: Text(
                          'Login', style: TextStyle(
                            fontSize: 25,
                            color: Colors.white
                        ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          print("I've been pressed");

                        },
                        child: Container(
                          width: 85,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/facebook sign in icon.png')
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          print("I've been pressed");
                        },
                        child: Container(
                          width: 85,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/gsign.png')
                              )
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
