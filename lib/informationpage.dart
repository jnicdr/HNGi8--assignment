import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 20, 20, 0),
                            child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Ink(
                                  decoration: ShapeDecoration(
                                      shape: CircleBorder(),
                                      color: Colors.deepOrange),
                                  child: IconButton(
                                      onPressed: () async {
                                        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                        if (pickedFile != null) {
                                          File? croppedFile = await ImageCropper.cropImage(
                                              sourcePath: pickedFile.path,
                                              aspectRatioPresets: [
                                                CropAspectRatioPreset.square,

                                              ],
                                              androidUiSettings: AndroidUiSettings(
                                                  toolbarTitle: 'Cropper',
                                                  toolbarColor: Colors.deepOrange,
                                                  toolbarWidgetColor: Colors.white,
                                                  initAspectRatio: CropAspectRatioPreset.original,
                                                  lockAspectRatio: false),
                                              iosUiSettings: IOSUiSettings(
                                                minimumAspectRatio: 1.0,
                                              )
                                          );
                                          if (croppedFile != null) {
                                            setState(() {
                                              imagePath = croppedFile.path;
                                            });
                                          }
                                        }
                                      },
                                      icon: Icon(Icons.camera_alt_rounded, size: 30,
                                          color: Colors.white)),
                                ),


                                const Text(
                                  'Click icon to \n add picture',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 12),
                                ),

                              ],
                            ),
                          ),
                          imagePath != ""
                              ? CircleAvatar( radius: 150,
                                child: ClipRRect( borderRadius: BorderRadius.circular(1000),
                                  child: Image.file(File(imagePath)),
                                ),
                              )
                              : ClipRRect(),
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
