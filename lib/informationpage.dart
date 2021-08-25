import 'dart:io';

import 'package:flutter/material.dart';


class informationpage extends StatefulWidget {
  String name, phonenumber, email;
  String imagePath;


  informationpage({
    required this.name,
    required this.phonenumber,
    required this.email,
    required this.imagePath
  });

  @override
  State<informationpage> createState() => _informationpageState();
}

class _informationpageState extends State<informationpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Welcome '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.deepOrange,
                  child: CircleAvatar(
                      radius: 63,
                      backgroundColor: Colors.grey,

                      child: Stack(

                        children: [
                          CircleAvatar( radius: 150,
                                child: ClipRRect( borderRadius: BorderRadius.circular(1000),
                                  child: Image.file(File(widget.imagePath)),
                                ),
                              )

                        ],
                      )),
                ),

              ],
            ),

            SizedBox(height: 20),
            const Text(
              'NAME',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                '${widget.name}', textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  'PHONE NUMBER',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.phonenumber}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
              child: Column(
                children: [
                  Text(
                    'EMAIL',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.email} ', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                  )


                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thanks for testing this with me',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                      ),
                      Icon(Icons.emoji_emotions,color: Colors.amber[700],)
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 100, 100);
  }
  bool shouldReclip(oldClipper) {
    return false;
  }
}
