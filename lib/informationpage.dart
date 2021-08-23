import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class informationpage extends StatefulWidget {
  String name, phonenumber, email;


  informationpage({
    required this.name,
    required this.phonenumber,
    required this.email,
  });

  @override
  State<informationpage> createState() => _informationpageState();
}

class _informationpageState extends State<informationpage> {
  String imagePath = "";

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Your Information'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
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
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    Ink(
                                      decoration: ShapeDecoration(
                                          shape: CircleBorder(),
                                          color: Colors.deepOrange),
                                      child: IconButton(
                                          onPressed: () async {
                                            final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                            if (pickedFile != null){
                                              setState((){
                                                imagePath = pickedFile.path;
                                              });
                                            }
                                          },
                                          icon: Icon(Icons.camera_alt_rounded, size: 30,
                                              color: Colors.white)),
                                    ),


                                    const Text(
                                      'Click here \n to add picture',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold, fontSize: 12),
                                    ),

                                  ],
                                ),
                              ),
                              imagePath != ""
                                  ? CircleAvatar( radius: 70,
                                child: Image.file(File(imagePath)),)
                                  : Container(),
                            ],
                          )),
                    ),

                  ],
                ),

              ],
            ),

            SizedBox(height: 20),
            const Text(
              'NAME',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    'PHONE NUMBER',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.phonenumber}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    'EMAIL',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.email}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
