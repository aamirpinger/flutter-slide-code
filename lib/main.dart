import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.amberAccent,
                    width: 195,
                    height: 200,
                    child: Icon(
                      Icons.settings_accessibility_outlined,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    width: 195,
                    height: 200,
                    child: Icon(
                      Icons.star_border,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250,
                child: Card(
                  elevation: 20,
                  color: Colors.greenAccent.shade100,
                  shadowColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('images/bulb.jpg'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 8,
                            ),
                            borderRadius: BorderRadius.circular(150),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 25,
                                blurRadius: 15,
                              ),
                            ]),
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'Idea!!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 48,
                          fontFamily: 'Calligraffitti',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    color: Colors.purple,
                    width: 195,
                    height: 200,
                    child: Icon(
                      Icons.perm_identity_outlined,
                      color: Colors.yellow,
                      size: 50,
                    ),
                  ),
                  Container(
                    color: Colors.lightGreenAccent,
                    width: 195,
                    height: 200,
                    child: Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
